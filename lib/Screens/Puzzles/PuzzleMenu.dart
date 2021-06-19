import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'MemoryMaster/memorymaster.dart';

class PuzzleMenu extends StatelessWidget {
  const PuzzleMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
          title: Center(
            child: Text('Puzzles'),
          ),
        ),

        body: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MemoryMaster()));
          },
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shadowColor: Colors.red.shade700,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  margin: EdgeInsets.symmetric(vertical: 1.0, horizontal: 60.0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/memorymaster.png'),
                      ),
                      SizedBox(height:20.0),
                      Text(
                        'Memory Master',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
