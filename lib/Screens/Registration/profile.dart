import 'package:deal_care/Screens/Shared/loading.dart';
import 'package:deal_care/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'forgot_passwd.dart';



class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title: Center(
            child: Text('PROFILE',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            TextButton(
              onPressed: (){
              },
              child: Card(
                color: Colors.grey.shade800,
                margin:
                EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    title: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async{
                setState(() {
                  loading = true;
                }); loading = false;
               await _auth.signOut();
                // setState(() {
                //   loading = false;
                // });
              },
              child: Card(
                color: Colors.grey.shade800,
                margin:
                EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
