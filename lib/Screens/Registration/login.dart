import 'package:deal_care/Screens/Registration/choice.dart';
import 'package:deal_care/Screens/Shared/loading.dart';
import 'package:deal_care/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deal_care/Screens/Registration/forgot_passwd.dart';
import 'package:deal_care/Screens/Home/home_page.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String error = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Stack(
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
                  SizedBox(height: 125.0,),
                  Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 170.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 90.0),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.0),
                            TextFormField(
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an Email' : null,
                              style: TextStyle(
                                color: Colors.white,
                              ),
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
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                filled: true,
                                fillColor: Colors.black87,
                              ),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              validator: (val) => val.length < 6
                                  ? 'Please enter valid password!'
                                  : null,
                              style: TextStyle(
                                color: Colors.white,
                              ),
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
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                filled: true,
                                fillColor: Colors.black87,
                              ),
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassword()));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 40.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.cyan.shade800),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(75.0),
                                        side: BorderSide(
                                          color: Colors.cyan.shade700,
                                        )),
                                  ),
                                  //minimumSize: MaterialStateProperty<size>
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                    print(result);
                                    if (result == null) {
                                      setState(() { error ='Invalid Login , please try again!';
                                    loading = false;
                                      });
                                    }
                                  }
                                }),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => UserType()));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
