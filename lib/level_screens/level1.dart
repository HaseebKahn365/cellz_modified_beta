import 'package:cellz_modified_beta/business_logic/game_state.dart';
import 'package:cellz_modified_beta/my_game.dart';
import 'package:cellz_modified_beta/screens.dart/game_play_overlay.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Level extends StatelessWidget {
  final levelNo;
  Level({
    super.key,
    required this.levelNo,
  });

  @override
  Widget build(BuildContext context) {
    GameState.offsetFromTopLeftCorner = 60;
    GameState.offsetFactoForSquare = 1.27;
    final game = MyGame(
      screenSize: MediaQuery.of(context).size,
      xP: 7,
      yP: 11,
    );

    return Scaffold(
      body: Stack(
        children: [
          //Here should be the overlay for game showing the players and the ui
          GamePlayScreen(), //this is just the overlay

          Container(padding: const EdgeInsets.only(top: 200), child: GameWidget(game: game)),
          // Positioned(
          //   bottom: 40,
          //   right: 10,
          //   child: Column(
          //     children: [
          //       FloatingActionButton(
          //         heroTag: null,
          //         onPressed: () async {
          //           await game.zoomIn();
          //         },
          //         child: Icon(Icons.zoom_in),
          //       ),
          //       const SizedBox(height: 10),
          //       GestureDetector(
          //         onLongPress: () async {
          //           print("Long press detected");
          //           await game.resetZoom();
          //         },
          //         child: FloatingActionButton(
          //           heroTag: null,
          //           onPressed: game.zoomOut,
          //           child: Icon(Icons.zoom_out),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Positioned(
          //   bottom: 40,
          //   left: 10,
          //   child: Row(
          //     children: [
          //       FloatingActionButton(
          //         heroTag: null,
          //         onPressed: () async {
          //           await game.moveRight();
          //         },
          //         child: Icon(Icons.arrow_back),
          //       ),
          //       const SizedBox(width: 10),
          //       Column(
          //         children: [
          //           FloatingActionButton(
          //             heroTag: null,
          //             onPressed: () async {
          //               await game.moveDown();
          //             }, // Keep this to avoid errors, but the action is handled by long press
          //             child: Icon(Icons.arrow_upward),
          //           ),
          //           const SizedBox(height: 20),
          //           FloatingActionButton(
          //             heroTag: null,
          //             onPressed: () async {
          //               await game.moveUp();
          //             },
          //             child: Icon(Icons.arrow_downward),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(width: 10),
          //       FloatingActionButton(
          //         heroTag: null,
          //         onPressed: () async {
          //           await game.moveLeft();
          //         },
          //         child: Icon(Icons.arrow_forward),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}


/*
Following are the configurations for the levels :
level 1: 2x2 grid
GameState.offsetFromTopLeftCorner = 275;
GameState.offsetFactoForSquare = 0.9;

level 2: 2x4 grid
GameState.offsetFromTopLeftCorner = 275;
GameState.offsetFactoForSquare = 0.9;


level 3: 3x3 grid
GameState.offsetFromTopLeftCorner = 150;
GameState.offsetFactoForSquare = 1.23;

level 4: 3x4 grid
GameState.offsetFromTopLeftCorner = 150;
GameState.offsetFactoForSquare = 1.23;

level 5: 3x5 grid
GameState.offsetFromTopLeftCorner = 150;
GameState.offsetFactoForSquare = 1.23;


level 6: 4x4 grid
GameState.offsetFromTopLeftCorner = 110;
GameState.offsetFactoForSquare = 1.25;

level 7: 4x5 grid
GameState.offsetFromTopLeftCorner = 110;
GameState.offsetFactoForSquare = 1.25;

level 8: 4x6 grid
GameState.offsetFromTopLeftCorner = 110;
GameState.offsetFactoForSquare = 1.25;

level 9: 4x7 grid
GameState.offsetFromTopLeftCorner = 110;
GameState.offsetFactoForSquare = 1.25;

level 10: 5x4 grid
GameState.offsetFromTopLeftCorner = 80;
GameState.offsetFactoForSquare = 1.32;

level 11: 5x5 grid
GameState.offsetFromTopLeftCorner = 80;
GameState.offsetFactoForSquare = 1.32;

level 12: 5x6 grid
GameState.offsetFromTopLeftCorner = 80;
GameState.offsetFactoForSquare = 1.32;

level 13: 5x7 grid
GameState.offsetFromTopLeftCorner = 80;
GameState.offsetFactoForSquare = 1.32;

level 14: 5x8 grid
GameState.offsetFromTopLeftCorner = 80;
GameState.offsetFactoForSquare = 1.32;

level 15: 6x4 grid
GameState.offsetFromTopLeftCorner = 70;
GameState.offsetFactoForSquare = 1.27;

level 16: 6x5 grid
GameState.offsetFromTopLeftCorner = 70;
GameState.offsetFactoForSquare = 1.27;

level 17: 6x6 grid
GameState.offsetFromTopLeftCorner = 70;
GameState.offsetFactoForSquare = 1.27;

level 18: 6x7 grid
GameState.offsetFromTopLeftCorner = 70;
GameState.offsetFactoForSquare = 1.27;

level 19: 6x8 grid
GameState.offsetFromTopLeftCorner = 70;
GameState.offsetFactoForSquare = 1.27;

level 20: 6x9 grid
GameState.offsetFromTopLeftCorner = 70;
GameState.offsetFactoForSquare = 1.27;

level 21: 6x10 grid
GameState.offsetFromTopLeftCorner = 70;
GameState.offsetFactoForSquare = 1.27;

level 22: 7x4 grid
Game















 */
