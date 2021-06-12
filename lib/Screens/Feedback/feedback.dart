import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedbackForm extends StatefulWidget {

  const FeedbackForm({Key key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade700,
            title: Center(
              child: Text(
                'MORE',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              TextButton(
                onPressed: (){
                },
                child: Card(
                  color: Colors.grey.shade700,
                  margin:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.account_box,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Text(
                        'Account',
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
                onPressed: (){
                },
                child: Card(
                  color: Colors.grey.shade700,
                  margin:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Text(
                        'Settings',
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
                onPressed: (){
                },
                child: Card(
                  color: Colors.grey.shade700,
                  margin:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.help,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Text(
                        'Help',
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
                onPressed: (){
                },
                child: Card(
                  color: Colors.grey.shade700,
                  margin:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.feedback_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Text(
                        'Feedback',
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
                onPressed: (){
                },
                child: Card(
                  color: Colors.grey.shade700,
                  margin:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.book,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      title: Text(
                        'Terms and Services',
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
      ),
    );
  }
}
