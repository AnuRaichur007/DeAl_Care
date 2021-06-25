import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  Results(
      {@required this.incorrect,
      @required this.total,
      @required this.correct,
      @required this.notattempted});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${widget.correct}/${widget.total}",
                style: TextStyle(fontSize: 40, color: Colors.grey.shade800),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "You answered ${widget.correct} answers correctly and ${widget.incorrect} answers incorrectly",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.teal.shade600,
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    "Go to home",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
