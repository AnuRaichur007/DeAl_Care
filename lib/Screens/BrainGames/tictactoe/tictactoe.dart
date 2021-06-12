import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'tictachome.dart';

void main () => runApp(Tictactoe());

class Tictactoe extends StatelessWidget {
  const Tictactoe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.black),
      home: TictacHome(),

    );
  }
}
