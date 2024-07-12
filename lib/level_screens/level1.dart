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
    GameState.offsetFromTopLeftCorner = 70;
    GameState.offsetFactoForSquare = 1.27;
    final game = MyGame(
      screenSize: MediaQuery.of(context).size,
      xP: 6,
      yP: 9,
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
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;

level 23: 7x5 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;

level 24: 7x6 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;

level 25: 7x7 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;

level 26: 7x8 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;

level 27: 7x9 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;

level 28: 7x10 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;

level 29: 7x11 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.27;


level 30: 8x4 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 31: 8x5 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 32: 8x6 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 33: 8x7 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 34: 8x8 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 35: 8x9 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 36: 8x10 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 37: 8x11 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 38: 8x12 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;



level 39: 8x13 grid
GameState.offsetFromTopLeftCorner = 60;
GameState.offsetFactoForSquare = 1.19;


level 40: 9x4 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 41: 9x5 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;



level 42: 9x6 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 43: 9x7 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 44: 9x8 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 45: 9x9 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 46: 9x10 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 47: 9x11 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;



level 48: 9x12 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 49: 9x13 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 50: 9x14 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 51: 9x15 grid
GameState.offsetFromTopLeftCorner = 50;
GameState.offsetFactoForSquare = 1.22;


level 52: 10x4 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 53: 10x5 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 54: 10x6 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 55: 10x7 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 56: 10x8 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 57: 10x9 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 58: 10x10 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 59: 10x11 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 60: 10x12 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 61: 10x13 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 62: 10x14 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 63: 10x15 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 64: 10x16 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;


level 65: 10x17 grid
GameState.offsetFromTopLeftCorner = 40;
GameState.offsetFactoForSquare = 1.3;









 */
