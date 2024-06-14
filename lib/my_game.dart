import 'dart:async';

import 'package:cellz_modified_beta/game_components/gui_dot.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  @override
  Color backgroundColor() {
    return Colors.blueGrey;
  }

  //OnLoad we should add all the dots of the grid

  @override
  FutureOr<void> onLoad() {
    world.add(Dot(
      Vector2(0, 0),
    ));
    world.add(Dot(
      Vector2(100, 0),
    ));
    return super.onLoad();
  }

  MyGame() : super() {
    debugMode = true; // Turn on debug mode for drawing bounding boxes
    camera = CameraComponent();
  }
}
