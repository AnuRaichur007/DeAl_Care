import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Help extends StatelessWidget {
  const Help({Key key}) : super(key: key);

  Widget helpers(String module, String explain) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
      child: Card(
        elevation: 6.0,
        shadowColor: Colors.red.shade400,
        color: Colors.grey.shade700,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            iconColor: Colors.white,
              children: [
                Text(explain,style: TextStyle(color: Colors.white),)
              ],
              title: Text(module, style: TextStyle(color: Colors.white),)
          ),
        ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Help',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          backgroundColor: Colors.teal.shade600,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              helpers('Location', 'This is a location module which will help caregiver to trace patients live location on daily basis'),
              helpers('Brain games', 'This module will help user to think and improve his/her cognitive thinking'),
              helpers('Puzzle', 'This is location!!'),
              helpers('Album', 'This is location!!'),
              helpers('Quiz', 'This is location!!'),
            ],
          ),
        ),
      ),
    );
  }
}
