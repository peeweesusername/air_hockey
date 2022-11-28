import 'package:air_hockey/playerpaddle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:air_hockey/airhockeygame.dart';

Widget pauseMenuBuilder(BuildContext buildContext, AirHockeyGame game) {
  return Center(
    child: Container(
      width: 250,
      height: 250,
      color: Colors.transparent,
      child:  Center(
        child: Column (
          children: [
            GestureDetector(
                onTap: (){
                  game.overlays.remove('PauseMenu');
                  game.resumeEngine();
                },
                child: const Text('Keep Playing', style: TextStyle(fontSize: 24, color: Colors.black))),
            const Text('', style: TextStyle(fontSize: 24)),
            GestureDetector(
                onTap: (){
                  SystemNavigator.pop();
                },
                child: const Text('Exit Game', style: TextStyle(fontSize: 24, color: Colors.black))),
          ],
        ),
      ),
    ),
  );
}

Widget faceoffMenuBuilder(BuildContext buildContext, AirHockeyGame game) {
  Text  whoScoredText;
  if (game.whoScored == PlayerColor.redPlayer) {
    whoScoredText =  Text('Team Red Scores!', style: TextStyle(fontSize: 24, color: Colors.black));
  }
  else if (game.whoScored == PlayerColor.bluePlayer) {
    whoScoredText = Text('Team Blue Scores!', style: TextStyle(fontSize: 24, color: Colors.black));
  }
  else {
    whoScoredText = Text("Let's Rock 'n' Roll!", style: TextStyle(fontSize: 24, color: Colors.black));
  }
  return Center(
    child: Container(
      width: 250,
      height: 250,
      color: Colors.transparent,
      child:  Center(
        child: Column (
          children: [
            whoScoredText,
            const Text('', style: TextStyle(fontSize: 24)),
            Text('Red Team: '  + game.redscore.toString(), style: TextStyle(fontSize: 24, color: Colors.black)),
            const Text('', style: TextStyle(fontSize: 12)),
            Text('Blue Team: '  + game.bluescore.toString(), style: TextStyle(fontSize: 24, color: Colors.black)),
            const Text('', style: TextStyle(fontSize: 24)),
            GestureDetector(
                onTap: (){
                  game.overlays.remove('FaceoffMenu');
                  game.resumeEngine();
                  game.puckDrop();
                },
                child: const Text('Puck Drop', style: TextStyle(fontSize: 24, color: Colors.black))),
            const Text('', style: TextStyle(fontSize: 12)),
            GestureDetector(
                onTap: (){
                  SystemNavigator.pop();
                },
                child: const Text('Exit Game', style: TextStyle(fontSize: 24, color: Colors.black))),
          ],
        ),
      ),
    ),
  );
}

Widget winnerMenuBuilder(BuildContext buildContext, AirHockeyGame game) {
  Text  winnerText;
  if (game.theWinner == PlayerColor.redPlayer) {
    winnerText =  Text('Team Red Wins!', style: TextStyle(fontSize: 24, color: Colors.black));
  }
  else {
    winnerText = Text('Team Blue Wins!', style: TextStyle(fontSize: 24, color: Colors.black));
  }
  return Center(
    child: Container(
      width: 250,
      height: 250,
      color: Colors.transparent,
      child:  Center(
        child: Column (
          children: [
            winnerText,
            const Text('', style: TextStyle(fontSize: 24)),
            GestureDetector(
                onTap: (){
                  game.overlays.remove('WinnerMenu');
                  game.resumeEngine();
                  game.NewGame();
                },
                child: const Text('New Game', style: TextStyle(fontSize: 24, color: Colors.black))),
            const Text('', style: TextStyle(fontSize: 12)),
            GestureDetector(
                onTap: (){
                  SystemNavigator.pop();
                },
                child: const Text('Exit Game', style: TextStyle(fontSize: 24, color: Colors.black))),
          ],
        ),
      ),
    ),
  );
}
