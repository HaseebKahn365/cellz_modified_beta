import 'dart:async';

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
    // TODO: implement onLoad
    return super.onLoad();
  }
}
