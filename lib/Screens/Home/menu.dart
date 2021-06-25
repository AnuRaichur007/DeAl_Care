import 'package:deal_care/Screens/BrainGames/braingames.dart';
import 'package:deal_care/Screens/Gallery/gallery.dart';
import 'package:deal_care/Screens/Puzzles/PuzzleMenu.dart';
import 'package:deal_care/Screens/Quiz/views/home.dart';
import 'package:deal_care/Screens/TO-DO/todoHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuList extends StatefulWidget {
  const MenuList({Key key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  Widget menugrid(String image, Widget path) {
    return Card(
      shadowColor: Colors.red.shade900,
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey.shade700,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => path));
        },
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade700,
          title: Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(50),
          crossAxisSpacing: 40,
          mainAxisSpacing: 50,
          crossAxisCount: 2,
          children: <Widget>[
            menugrid('assets/images/To-Do.png', TodoHome()),
            menugrid('assets/images/Camera.png', Album()),
            menugrid('assets/images/BrainGames.png', BrainMenu()),
            menugrid('assets/images/Quiz.png', Home()),
            menugrid('assets/images/Puzzle.png', PuzzleMenu()),
            Container(color: Colors.white24,)
          ],
        ),
      ),
    );
  }
}
