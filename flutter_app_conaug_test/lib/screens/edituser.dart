import 'package:flutter/material.dart';
import 'package:flutterappconaugtest/models/user.dart';
import 'package:flutterappconaugtest/services/auth.dart';
import 'package:flutterappconaugtest/services/database.dart';
import 'package:flutterappconaugtest/shared/constans.dart';
import 'package:fluttertoast/fluttertoast.dart';


class EditUserItems extends StatefulWidget {

  final UserData user;
  EditUserItems({this.user});
  @override
  _EditUserItemsState createState() => _EditUserItemsState();
}

class _EditUserItemsState extends State<EditUserItems> {
  final AuthService _authen = AuthService();

  final _formKey = GlobalKey<FormState>();
  String FirstName = '';
  String LastName = '';
  String Email = '';
  String ContactNumber = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Edit Here')
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child:SingleChildScrollView(
                  child:Column(
                    children: <Widget>[
                      Text('Edit',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),),
                      SizedBox(height: 20.0),
                      TextFormField(
                        initialValue: widget.user.FirstName,
                        decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                        validator: (val) => val.isEmpty ? 'Enter your First Name' : null,
                        onChanged: (val){
                          setState(() {
                            FirstName = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        initialValue: widget.user.LastName,
                        decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                        validator: (val) => val.isEmpty ? 'Enter your Last Name' : null,
                        onChanged: (val){
                          setState(() {
                            LastName = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),


                      TextFormField(
                        initialValue: widget.user.Email,
                        decoration: textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                        onChanged: (val){
                          setState(() {
                            Email = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),

                      TextFormField(
                        initialValue: widget.user.ContactNumber,
                        decoration: textInputDecoration.copyWith(hintText: 'Contact Number'),
                        validator: (val) => val.isEmpty ? 'Enter a ContactNumber' : null,
                        onChanged: (val){
                          setState(() {
                            ContactNumber = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),

                      RaisedButton(
                          color: Colors.brown[800],
                          child: Text('Register',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed:() async
                          {
                            if(_formKey.currentState.validate()) {
                              dynamic result = await  DatabaseService(uid:widget.user.uid).updateUserData(
                                  FirstName ?? widget.user.FirstName,
                                  LastName ?? widget.user.LastName,
                                  Email ??  widget.user.Email,
                                  ContactNumber ?? widget.user.ContactNumber);

                              Fluttertoast.showToast(
                                  msg: "Edited successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green[800],
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              if(result == null)
                              {
                                setState(() {
                                  error = ' error';
                                });

                              }
                            }
                            else
                            {
                              setState(() {
                                error = '';
                              });
                            }
                          }
                      ),
                      Text(error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),),

                    ],
                  )
              )
          ),
        ),
      ),
    );
  }
}
