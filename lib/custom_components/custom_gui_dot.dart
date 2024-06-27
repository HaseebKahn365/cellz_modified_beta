//here we should be able to override the behaviours of the gui dot by extending the gui dot class.

/*
Here are the customziation that we are gonna be able to do
adjustable radius to glaal offset factor
ovrridable aiRespone method so that in future we can use streambuilder with firestore to allow players from around the world to compete.
overridable dot color and line paint color.
 */

import 'package:cellz_modified_beta/business_logic/point.dart';
import 'package:cellz_modified_beta/game_components/gui_dot.dart';

class CustomGuiDot extends Dot {
  CustomGuiDot({required Point myPoint, double radFactor = 0.1}) : super(myPoint, radFactor: radFactor);
}
