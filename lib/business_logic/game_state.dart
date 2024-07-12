//this is a class that contains all the state of the game in the form of static members and methods

import 'package:cellz_modified_beta/business_logic/game_canvas.dart';
import 'package:cellz_modified_beta/business_logic/lines.dart';
import 'package:cellz_modified_beta/business_logic/point.dart';
import 'package:cellz_modified_beta/business_logic/square.dart';
import 'package:flutter/material.dart';

/*
We have used static members all over the place due to which the performance of the game is not as good as it should be.
lets rename this class, make the members non static and create an instance with the name of GameState so that i don't have to change the whole code.

 */

class GameStateClass {
  Map<String, Line> linesDrawn = {};

  double globalOffset = 150; //this is the offset that is used to properly adjust the dots in the game.
  double offsetFromTopLeftCorner = 40; //this is the offset from the top left corner of the screen
  double offsetFactoForSquare = 0.5; //this is the factor that is used to adjust the square size

// and Here is how we store the all points in the game
  Map<int, Point> allPoints = {}; //key is the location aka the index of the point in the grid

  List<Color> colorSet = [
    Colors.purple, //color for bg
    Colors.white, //color for drag line
    Colors.blue, //dot color

    Colors.green, //human color
    Colors.red, //AI color

    Colors.white, //square icon box color //5th index

    Colors.red, //most recent line color //6th index
    Colors.teal, //old line color //7th index
  ];

  List<IconData> iconSet = [
    Icons.check, //human
    Icons.close_rounded, //ai icon
  ];

  //a  member for all squares
  Map<String, Square> allSquares = {};

  //a  member to control the turns oof the player.
  bool myTurn = true; //if false then it is AI's turn

  //To add some spice to the game, we record the chain of square formation which is identified if the turn doesn't change and player keeps making squares

  int chainCount = 0;

  void switchTurn() {
    print('Switching turn since No square was formed & chain count is $chainCount');

    myTurn = !myTurn;
    chainCount = 0; //reset chain square count as turn changes
  }

  //the gameState will also have a GameCanvas instance that will be used for maintaining the info about the current level
  late GameCanvas gameCanvas;

  //we should have a map of all the valid lines in the game so that invalid lines may not be allowed to draw

  Map<String, Line> validLines = {};

  initGameCanvas({required int xPoints, required int yPoints}) {
    gameCanvas = GameCanvas(xPoints: xPoints, yPoints: yPoints);
    validLines = gameCanvas.drawAllPossibleLines();
  }
}

GameStateClass GameState = GameStateClass();
