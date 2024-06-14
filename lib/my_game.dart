import 'dart:async';

import 'package:cellz_modified_beta/business_logic/game_canvas.dart';
import 'package:cellz_modified_beta/business_logic/game_state.dart';
import 'package:cellz_modified_beta/game_components/gui_dot.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  final int xP, yP;

  late final GameCanvas level1Canvas;

  MyGame({required this.xP, required this.yP}) {
    debugMode = true;
    camera = CameraComponent();
    level1Canvas = GameCanvas(xPoints: xP, yPoints: yP);
    level1Canvas.createPoints();
  }

  @override
  Color backgroundColor() {
    return Colors.blueGrey;
  }

  //OnLoad we should add all the dots of the grid

  @override
  FutureOr<void> onLoad() {
    //adding all the dots to the game using the list of allPoints
    GameState.allPoints.forEach((key, value) {
      add(Dot(value));
    });
    return super.onLoad();
  }
}


//use the following canvas information to construct the grid
/*GameCanvas gameCanvas = GameCanvas(xPoints: 4, yPoints: 4);

class GameCanvas {
  static double globalThreshold = 100;
  int xPoints;
  int yPoints;
  late int movesLeft;
  GameCanvas({required this.xPoints, required this.yPoints}) {
    createPoints();
    calculateMovesLeft();
  }

  void createPoints() {
    // Make sure to empty the allPoints map before adding new points
    // Also make sure to empty the linesDrawn map
    GameState.allPoints = {};
    GameState.linesDrawn = {};

    for (int j = 0; j < yPoints; j++) {
      for (int i = 0; i < xPoints; i++) {
        GameState.allPoints[j * xPoints + i] = Point(xCord: i, yCord: j, location: j * xPoints + i);
      }
    }
  }
 */
