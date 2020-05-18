import 'package:flutter/material.dart';
import 'package:flutterappconaugtest/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutterappconaugtest/models/user.dart';

import 'displaylist.dart';



class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserData>>.value(
        value: DatabaseService().Users,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            backgroundColor: Colors.brown[400],
            title: Text('users'),
          ),
          body: Container(

            child:DisplayList()
          ),
        ));
  }
}
