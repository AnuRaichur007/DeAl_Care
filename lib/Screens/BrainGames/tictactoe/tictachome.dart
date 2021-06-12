import 'dart:math';

import 'package:deal_care/Screens/BrainGames/tictactoe/cutom_dialouge.dart';
import 'package:deal_care/Screens/BrainGames/tictactoe/game_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TictacHome extends StatefulWidget {
  const TictacHome({Key key}) : super(key: key);

  @override
  _TictacHomeState createState() => _TictacHomeState();
}

class _TictacHomeState extends State<TictacHome> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activerPlayer1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    activerPlayer1 = 1;
    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb){
setState(() {
  if(activerPlayer1==1){
    gb.text = 'X';
    gb.bg = Colors.red;
    activerPlayer1 =2;
    player1.add(gb.id);
  }else{
    gb.text = 'O';
    gb.bg = Colors.black;
    activerPlayer1 = 1;
    player2.add(gb.id);
  }
  gb.enabled=false;
int winner=  checkWinner();
if(winner==-1){
  if(buttonsList.every((p) => p.text !="")){
    showDialog(context: context, builder: (_)=> CustomDialog("Game tied!","Press the reset button to start again!" , resetGame));
  }else{
    activerPlayer1==2 ? autoplay() : null;
  }
}
});
  }

  void autoplay(){
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i+1);
    for(var cellID in list){
      if(!(player1.contains(cellID) || player2.contains(cellID))){
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var ranIndex = r.nextInt(emptyCells.length-1);
    var cellID  = emptyCells[ranIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }


  int checkWinner(){
    var winner = -1;
    if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
      winner=1;
    }
    if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
      winner=2;
    }
    //row 2
    if(player1.contains(4) && player1.contains(5) && player1.contains(6)){
      winner=1;
    }
    if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
      winner=2;
    }
    //row 3
    if(player1.contains(7) && player1.contains(8) && player1.contains(9)){
      winner=1;
    }
    if(player2.contains(7) && player2.contains(8) && player2.contains(9)){
      winner=2;
    }

    // column 1
    if(player1.contains(1) && player1.contains(4) && player1.contains(7)){
      winner=1;
    }
    if(player2.contains(1) && player2.contains(4) && player2.contains(7)){
      winner=2;
    }
    // column 2
    if(player1.contains(2) && player1.contains(5) && player1.contains(8)){
      winner=1;
    }
    if(player1.contains(2) && player2.contains(5) && player2.contains(8)){
      winner=2;
    }
    //column 3
    if(player1.contains(3) && player1.contains(6) && player1.contains(9)){
      winner=1;
    }
    if(player2.contains(3) && player2.contains(6) && player2.contains(9)){
      winner=2;
    }
    //diagonal
    if(player1.contains(1) && player1.contains(5) && player1.contains(9)){
      winner=1;
    }
    if(player2.contains(1) && player2.contains(5) && player2.contains(9)){
      winner=2;
    }
    //diagonal 2
    if(player1.contains(3) && player1.contains(5) && player1.contains(7)){
      winner=1;
    }
    if(player2.contains(3) && player2.contains(5) && player2.contains(7)){
      winner=2;
    }

    if(winner !=-1){
      if(winner==1){
           showDialog(context: context, 
               builder: (_)=> new CustomDialog('Player 1 has won!', 'Press the reset button to start again!', resetGame));
      }else{
        showDialog(context: context,
            builder: (_)=> new CustomDialog('Player 2 has won!', 'Press the reset button to start again!', resetGame));
      }
    }
    return winner;
  }

  void resetGame(){
    if(Navigator.canPop(context)) { Navigator.pop(context);}
    setState(() {
      buttonsList = doInit();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tic Tac Toe')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context, i) => new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    onPressed: buttonsList[i].enabled ? () => playGame(buttonsList[i]):null,
                    child: Text(
                      buttonsList[i].text,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: buttonsList[i].bg,
                    disabledColor: buttonsList[i].bg,
                  ),)
            ),
          ),
          ElevatedButton(

              onPressed: resetGame, child: Text('Reset',
          style: TextStyle(color: Colors.white,fontSize: 20.0),))
        ],
      ),
    );
  }
}
