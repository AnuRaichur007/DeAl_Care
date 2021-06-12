import 'package:deal_care/Screens/Registration/registration.dart';
import 'package:deal_care/Screens/Registration/registration2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserType extends StatefulWidget {

  const UserType({Key key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/registration.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Are you a',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 150.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Registration()));
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage('assets/images/caregiver.png'),
                      ),
                    ),
                    Text(
                      'Caregiver',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => PatientRegistration()));
                      },
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            AssetImage('assets/images/patient.png'),
                      ),
                    ),
                    Text(
                      'Patient',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
