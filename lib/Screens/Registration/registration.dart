import 'package:deal_care/Screens/Registration/login.dart';
import 'package:deal_care/Screens/Shared/loading.dart';
import 'package:deal_care/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String conpassword = '';
  String name = '';
  String phone = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Stack(
            children: [
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
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 60.0),
                      Center(
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 80.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 90.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an Name' : null,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    size: 30.0,
                                    color: Colors.grey.shade900,
                                  ),
                                  hintText: 'Name',
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
                                  setState(() => name = val);
                                },
                              ),
                              SizedBox(height: 20),
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
                              SizedBox(height: 20),
                              TextFormField(
                                validator: (val) => val.length < 10
                                    ? 'Please enter valid Phone number!'
                                    : null,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone,
                                    size: 30.0,
                                    color: Colors.grey.shade900,
                                  ),
                                  hintText: 'Contact',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15.0,
                                  ),
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(50.0)),
                                  filled: true,
                                  fillColor: Colors.black87,
                                ),
                                onChanged: (val) {
                                  setState(() => phone = val);
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'Password should be atleast 6 characters!'
                                    : null,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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
                              SizedBox(height: 20),
                              TextFormField(
                                validator: (val) => val.length < 6
                                    ? 'Password should be same as previous one!'
                                    : null,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  filled: true,
                                  fillColor: Colors.black87,
                                ),
                                onChanged: (val) {
                                  setState(() => conpassword = val);
                                },
                              ),
                              SizedBox(height: 30),
                              ElevatedButton(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18.0, horizontal: 40.0),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.purple.shade700),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(75.0),
                                          side: BorderSide(
                                            color: Colors.purple.shade600,
                                          )),
                                    ),
                                    //minimumSize: MaterialStateProperty<size>
                                  ),
                                  onPressed: () async {
                                    choiceindex = 0;
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      loading = false;
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              name, email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = 'Please give valid email';
                                          loading=false;
                                        });
                                      }
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext)=>Login()));
                                    }
                                  }),
                              SizedBox(height: 12.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
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
                            'Already a user?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          );
  }
}
