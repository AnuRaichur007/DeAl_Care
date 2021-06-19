import 'package:deal_care/Screens/Home/Location/location.dart';
import 'package:deal_care/Screens/Home/menu.dart';
import 'package:deal_care/Screens/More/moremenu.dart';
import 'package:deal_care/Screens/Registration/profile.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    LiveLocation(),
    MenuList(),
    FeedbackForm(),
    Profile(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade900,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 25.0,),
            label: 'Home',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu,size: 25.0,),
            label: 'Menu',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz,size: 25.0,),
            label: 'More',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,size: 25.0,),
            label: 'Profile',
            backgroundColor: Colors.teal,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
