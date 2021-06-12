import 'package:deal_care/Screens/Registration/choice.dart';
import 'package:deal_care/Screens/Registration/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(children: [
            Container(
              alignment: Alignment(0.0, -1.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Welcome.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => UserType()));
                  },
                  child: Card(
                    color: Colors.indigo.shade400,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: ListTile(
                        // leading: Icon(
                        //   Icons.phone,
                        //   size: 25.0,
                        //   color: Colors.teal,
                        // ),
                        title: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => Login()));
                  },
                  child: Card(
                    color: Colors.indigo.shade400,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 25.0),
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: ListTile(
                        // leading: Icon(
                        //   Icons.email,
                        //   color: Colors.teal,
                        //   size: 25.0,
                        // ),
                        title: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
