import 'package:cellz_modified_beta/my_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 300),
      child: GameWidget(
          game: MyGame(
        xP: 2,
        yP: 2,
      )),
    );
  }
}
