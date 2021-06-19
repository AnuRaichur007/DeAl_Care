import 'package:deal_care/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GiveFeedback extends StatefulWidget {
  const GiveFeedback({Key key}) : super(key: key);

  @override
  _GiveFeedbackState createState() => _GiveFeedbackState();
}

class _GiveFeedbackState extends State<GiveFeedback> {

  void displayPopup(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Feedback'),
      content: Text('Successful'),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String content = '';
  String error = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
          title: Center(
            child: Text(
              'Feedback',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 40.0),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an Name' : null,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 10.0),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                      ),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      filled: true,
                      fillColor: Colors.grey.shade800,
                    ),
                    onChanged: (val) {
                      setState(() => name = val);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 40.0),
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 10.0),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                      ),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      filled: true,
                      fillColor: Colors.grey.shade800,
                    ),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 40.0),
                  child: TextFormField(
                    validator: (val) =>
                        val.isEmpty ? 'Please enter some text!' : null,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 10.0),
                      hintText: 'Content',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade800,
                    ),
                    maxLines: 8,
                    minLines: 3,
                    onChanged: (val) {
                      setState(() => content = val);
                    },
                  ),
                ),
                SizedBox(height: 100.0),
                ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 40.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal.shade700),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(75.0),
                            side: BorderSide(
                              color: Colors.teal.shade700,
                            )),
                      ),
                      //minimumSize: MaterialStateProperty<size>
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await _auth.feedbackForm(name, email, content);
                        displayPopup(context);
                      }
                    }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
