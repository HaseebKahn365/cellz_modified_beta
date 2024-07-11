//here we should be able to override the behaviours of the gui dot by extending the gui dot class.

/*
Here are the customziation that we are gonna be able to do
adjustable radius to glaal offset factor
ovrridable aiRespone method so that in future we can use streambuilder with firestore to allow players from around the world to compete.
overridable dot color and line paint color.
 */

import 'dart:developer';

import 'package:cellz_modified_beta/business_logic/game_state.dart';
import 'package:cellz_modified_beta/business_logic/point.dart';
import 'package:cellz_modified_beta/game_components/gui_dot.dart';
import 'package:flame/game.dart';

class CustomGuiDot extends Dot {
  CustomGuiDot({required Point myPoint, double radFactor = 0.13}) : super(myPoint, radFactor: radFactor);

  /*
  Lets override this method which is in the dot to automaticaly make my turn true if it is false

   Future<void> overridableAiResponse() async {
    await aiFunction.buildReadyLines(gameRef);
  }

   */

  @override
  Future<void> overridableAiResponse() async {
    log("This is the overridableAiResponse method in the customGuiDot class");
    if (!GameState.myTurn) {
      GameState.myTurn = true;
    }
  }
}
