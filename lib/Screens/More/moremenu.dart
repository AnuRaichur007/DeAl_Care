import 'package:deal_care/Screens/More/feedback.dart';
import 'package:deal_care/Screens/More/settings.dart';
import 'package:deal_care/Screens/More/terms_services.dart';
import 'package:deal_care/Screens/Registration/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'help.dart';

class FeedbackForm extends StatefulWidget {

  const FeedbackForm({Key key}) : super(key: key);

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {

  Widget moreCard(String text, IconData icon, Widget path){
    return TextButton(
      onPressed: (){
        // ignore: non_constant_identifier_names
        Navigator.push(context, MaterialPageRoute(builder: (context)=> path));
      },
      child: Card(
        color: Colors.grey.shade800,
        shadowColor: Colors.red.shade600,
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10.0,
        margin:
        EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.white,
              size: 30.0,
            ),
            title: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title: Center(
            child: Text(
              'More',
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            moreCard('Account', Icons.account_circle, Profile()),
            moreCard('Settings', Icons.settings, Settings()),
            moreCard('Help', Icons.help, Help()),
            moreCard('Feedback', Icons.feedback, GiveFeedback()),
            moreCard('Terms and Services', Icons.book, TermsAndServices()),
          ],
        ),
      ),
    );
  }
}
