import 'package:flutter/material.dart';
import 'package:flutterappconaugtest/services/auth.dart';
import 'package:flutterappconaugtest/shared/constans.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _authen = AuthService();
  final _formKey = GlobalKey<FormState>();
  String FirstName = '';
  String LastName = '';
  String Password = '';
  String Email = '';
  String ContactNumber = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Register Here'),
          actions: <Widget>[
        FlatButton.icon(
        icon: Icon(Icons.person_outline,),
        label: Text('users',
          style: TextStyle(
            color: Colors.white,
          ),),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Display()));
        }
        
        )
    ]),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child:SingleChildScrollView(
              child:Column(
                children: <Widget>[
                  Text('Enter your details correctly and click Register',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),),
                  SizedBox(height: 20.0),
                  TextFormField(
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
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                    obscureText: true,
                    onChanged: (val){
                      Password = val;
                    },
                  ),
                  SizedBox(height: 20.0),

                  TextFormField(
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
                        dynamic result = await  _authen.Register( Password,  FirstName,  LastName,  Email,  ContactNumber);
                        Fluttertoast.showToast(
                            msg: "Registered successfully",
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
                            error = 'Sign up error';
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
