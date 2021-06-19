import 'package:deal_care/Screens/Registration/edit_profile.dart';
import 'package:deal_care/Screens/Shared/loading.dart';
import 'package:deal_care/Welcome/welcome.dart';
import 'package:deal_care/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _auth = AuthService();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.teal.shade600,
                title: Center(
                  child: Text(
                    'PROFILE',
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
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=> EditProfile()));
                    },
                    child: Card(
                      color: Colors.grey.shade800,
                      shadowColor: Colors.red.shade600,
                      elevation: 10.0,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
            ),
                      margin:
                          EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 30.0,
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
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await _auth.signOut();
                      loading=false;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext)=>WelcomePage()));
                      // setState(() {
                      //   loading = false;
                      // });
                    },
                    child: Card(
                      shadowColor: Colors.red.shade600,
                      elevation: 10.0,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.grey.shade800,
                      margin:
                          EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
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
