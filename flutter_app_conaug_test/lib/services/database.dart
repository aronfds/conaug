
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterappconaugtest/models/user.dart';

class DatabaseService{

  final String uid;

  DatabaseService({this.uid});
  //collection reference
  final CollectionReference Collection = Firestore.instance.collection('users');

  Future updateUserData(String FistName, String LastName, String Email, String ContactNumber) async{
    return await Collection.document(uid).setData({
      'FirstName':FistName,
      'LastName':LastName,
      'Email':Email,
      'ContactNumber': ContactNumber});
  }




  //brew list from the snapshot
  List<UserData>  _userListFromSnapshot (QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return UserData(
          FirstName: doc.data['FirstName'] ?? '',
          LastName: doc.data['LastName'] ?? '',
          Email: doc.data['Email'] ?? '',
          ContactNumber: doc.data['ContactNumber'] ?? ''
          );
    }).toList();
  }

  //get brew stream
  Stream <List<UserData>>  get  Users
  {
    return Collection.snapshots().map(_userListFromSnapshot);
  }

  //user data from snapshot
  UserData _userDataFromSnapshot (DocumentSnapshot snapshot)
  {
    return  UserData(
      uid: uid,
      FirstName: snapshot.data['FirstName'],
      LastName: snapshot.data['LastName'],
      Email: snapshot.data['Email'],
      ContactNumber: snapshot.data['ContactNumber']
    );
  }

  Future deleteItemData(String id) async{
    return await Collection.document(id).delete();
  }

  Stream<UserData> get userData{
    return Collection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
