import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Text(
            'Settings',
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
