import 'package:flutter/material.dart';
import 'package:flutterappconaugtest/models/user.dart';
import 'package:flutterappconaugtest/screens/edituser.dart';
import 'package:flutterappconaugtest/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DisplayTile extends StatelessWidget {
  final UserData user;
  DisplayTile({this.user});

  @override
  Widget build(BuildContext context) {
    String FirstName = user.FirstName;
    String LastName = user.LastName;
    String Email = user.Email;
    String ContactNumber = user.ContactNumber;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child:Card(
        margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10.0),
        elevation: 5,
        child:Container(
            padding: const EdgeInsets.all(10.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('First Name: $FirstName', style: Theme.of(context).textTheme.title),
              Text('last Name: $LastName',style: TextStyle(fontSize: 20.0)),
              Text('Email: $Email ₹',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
              Text('ContactNumber $ContactNumber', style: TextStyle(color: Colors.black.withOpacity(0.4))),
              ButtonBar(
                children: <Widget>[
                  IconButton(
                    icon:Icon(Icons.edit),
                    iconSize: 28.0,
                    tooltip: 'Edit User Details',
                    color: Colors.green[800],
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditUserItems(user: user)),
                      );
                    },
                  ),

                  IconButton(
                    icon:Icon(Icons.delete),
                    iconSize: 28.0,
                    tooltip: 'Delete Item',
                    color: Colors.red[800],
                    onPressed: () async{

                      await DatabaseService().deleteItemData(user.uid);
                      Fluttertoast.showToast(
                          msg: "Item deleted successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green[800],
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                  ),

                ],
              )

            ],
          )
        )
      )
    );
  }
}
