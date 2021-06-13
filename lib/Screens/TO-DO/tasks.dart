import 'package:flutter/material.dart';

Widget tasks(int n) {
  return Card(
    color: Colors.teal.shade400,
    margin:
    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(
          'Task$n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}