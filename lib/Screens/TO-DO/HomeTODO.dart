import 'package:deal_care/Screens/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal.shade700,
            centerTitle: true,
            // leading: Icon(Icons.arrow_back),
            toolbarHeight: 60.0,
            title: Text(
              'Schedular ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('hello!!'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.grey.shade700,
                            child: Icon(Icons.add),
                            onPressed: (){

                            }
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
