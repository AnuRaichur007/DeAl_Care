import 'package:deal_care/Screens/TO-DO/AddTask.dart';
import 'package:deal_care/Screens/TO-DO/Addnotes.dart';
import 'package:flutter/material.dart';

import 'Mytasks.dart';
import 'completed.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key key}) : super(key: key);

  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MyTasks(),
    AddTask(),
    AddNotes(),
    Completed(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade600,
          title: Center(
            child: Text('Schedular'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal.shade700,
          unselectedItemColor: Colors.grey.shade800,
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.work,
                size: 25.0,
              ),
              label: 'My tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 25.0,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sticky_note_2_sharp,
                size: 25.0,
              ),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.check_circle,
                size: 25.0,
              ),
              label: 'Completed',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
    );
  }
}
