import 'package:deal_care/Screens/Feedback/feedback.dart';
import 'package:deal_care/Screens/Home/menu.dart';
import 'package:deal_care/Screens/Registration/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Menu',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
    Text(
      'Index 3: Logout',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 1:
          {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => MenuList()));
          }
          break;
        case 2:
          {
            print('2');
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Profile()));
          }
          break;
        case 3:
          {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => FeedbackForm()));
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade500,
          title: Center(child: Text('Live location')),
        ),
        bottomNavigationBar: BottomNavigationBar(
          //  backgroundColor: Colors.lightGreen.shade900,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.teal.shade600,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 30.0,
              ),
              label: 'Menu',
              backgroundColor: Colors.teal.shade600,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
              backgroundColor: Colors.teal.shade600,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
              backgroundColor: Colors.teal.shade600,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
