import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  // bool isUserLoggedIn = false;

  //@override
  // void initState() {
  //   getLoggedInState();
  //   super.initState();
  // }
  //
  // getLoggedInState() async {
  //   await Constants.getUerLoggedInSharedPreference().then((value) {
  //     setState(() {
  //       isUserLoggedIn = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Quizzler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
