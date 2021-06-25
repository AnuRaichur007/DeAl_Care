import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
          title: Center(
            child: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: <Widget>[
                  Icon(Icons.account_circle,color: Colors.grey.shade800,size: 150.0,),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an Name' : null,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
