import 'package:deal_care/Screens/Registration/login.dart';
import 'package:deal_care/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import '../../main.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';
  String conpassword = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Center(
                    child: Text(
                      "FORGOT PASSWORD?",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 165.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 90.0),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if (value==null || value.isEmpty){
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.email,
                                size: 30.0,
                                color: Colors.grey.shade900,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0,
                              ),
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(30.0)
                              ),
                              filled: true,
                              fillColor: Colors.black87,
                            ),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (value){
                              if (value==null || value.isEmpty){
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                size: 30.0,
                                color: Colors.grey.shade900,
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15.0,
                              ),
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(30.0)
                              ),
                              filled: true,
                              fillColor: Colors.black87,
                            ),
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            validator: (value){
                              if (value==null || value.isEmpty){
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                size: 30.0,
                                color: Colors.grey.shade900,
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0,
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(50.0)
                              ),
                              filled: true,
                              fillColor: Colors.black87,
                            ),
                            onChanged: (val) {
                              setState(() => conpassword = val);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40.0),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.cyan.shade800),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(75.0),
                              side: BorderSide(
                                color: Colors.cyan.shade700,
                              )),
                        ),
                        //minimumSize: MaterialStateProperty<size>
                      ),
                      onPressed: () async {
                        print(email);
                        print(password);
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Login()));
                      }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
