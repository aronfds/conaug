import 'package:flutter/material.dart';
import 'package:flutterappconaugtest/models/user.dart';
import 'package:provider/provider.dart';

import 'DisplayTile.dart';

class DisplayList extends StatefulWidget {
  @override
  _DisplayListState createState() => _DisplayListState();
}

class _DisplayListState extends State<DisplayList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserData>>(context) ?? [];
    if(users.length == 0)
    {
      return Center(

          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.sentiment_very_dissatisfied,
                  size:100,
                  color:Colors.green[800]),
              Text('No Users yet',
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 20.0,
                ),)
            ],
          )
      );
    }
    else{
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          return DisplayTile(user: users[index]);
        },
      );
    }

  }
}
