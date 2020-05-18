import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterappconaugtest/models/user.dart';


import 'database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user)  {
    return  user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
//        .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }


  //Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register
  Future Register(String password, String FirstName, String LastName, String Email, String ContactNumber) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: Email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUserData(FirstName, LastName, Email, ContactNumber);
      return _userFromFirebaseUser(user);
    }

    catch (e) {
      print(e.toString());
    }
  }
}