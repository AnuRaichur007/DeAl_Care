import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TermsAndServices extends StatelessWidget {
  const TermsAndServices({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Text(
            'Terms and Services',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(''),

          ],
        ),
      ),
    );
  }
}
