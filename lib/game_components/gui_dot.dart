import 'dart:developer';

import 'package:cellz_modified_beta/business_logic/game_canvas.dart';
import 'package:cellz_modified_beta/business_logic/point.dart';
import 'package:cellz_modified_beta/game_components/gui_line.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

//the dot is able to have collision detection with another dot and create lines

enum LineDirection {
  up,
  down,
  left,
  right,
}

class Dot extends PositionComponent with DragCallbacks, CollisionCallbacks {
  Point fixedPosition; //using the concept of composition for the fixed position of the dot
  Offset? dragStart;
  Offset? dragEnd;

  final globalThreshold = GameCanvas.globalThreshold;

  double radius = 15;

  double dynamicRadius = 0;

  @override
  Vector2 center = Vector2(0, 0);

  //in constructor make the player position centered
  Dot(
    this.fixedPosition,
  ) {
    dynamicRadius = radius * 1.5;
    anchor = Anchor.center;

    size = Vector2(0, 0) + Vector2.all(radius * 2); // Set the size of the player
    center = size / 2;

    position = Vector2(fixedPosition.xCord.toDouble() * 100 + 60, fixedPosition.yCord.toDouble() * 100 + 60);
  }

  @override
  Future<void> onLoad() async {
    return super.onLoad();
  }

  @override
  void onDragStart(DragStartEvent event) {
    dragStart = event.localPosition.toOffset();
    dragEnd = event.localPosition.toOffset();

    super.onDragStart(event);
  }

  //one dot can only have 4 lines originating from it also same direction lines are not allowed
  int linesLimit = 4;
  //Array of used LineDirections
  List<LineDirection> usedDirections = [];

  @override
  void onDragUpdate(DragUpdateEvent event) {
    dragEnd = event.localStartPosition.toOffset();
    radius = 10;
    //check if the distance between the dragStart and dragEnd is greater than the threshold then draw a line
    if ((dragEnd! - dragStart!).distance > globalThreshold * 1.5) {
      LineDirection direction = getDirection(dragStart!, dragEnd!);

      log('Direction of line is : $direction');

      switch (direction) {
        case LineDirection.up:
          if (lineApprover(
            direction,
          )) {
            final upLine = GuiLine(center.toOffset(), center.toOffset() - Offset(0, globalThreshold));
            add(upLine);
            log('Up line created'); //great job!
          }

          break;
        case LineDirection.down:
          final downLine = GuiLine(center.toOffset(), center.toOffset() + Offset(0, globalThreshold));
          if (lineApprover(direction)) {
            add(downLine);
            log('Down line created');
          }

          break;
        case LineDirection.left:
          final leftLine = GuiLine(center.toOffset(), center.toOffset() - Offset(globalThreshold, 0));

          if (lineApprover(direction)) {
            add(leftLine);
            log('Left line created');
          }

          break;
        case LineDirection.right:
          final rightLine = GuiLine(center.toOffset(), center.toOffset() + Offset(globalThreshold, 0));

          if (lineApprover(direction)) {
            add(rightLine);
            log('Right line created');
          }

          break;
      }
      dragEnd = null; //to make sure we don't visualize the drag line after the line is created
    }

    super.onDragUpdate(event);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    //temporarily creating a new line

    dragEnd = null;

    super.onDragEnd(event);
  }

  final dragCoefficient = 0.4; //this is for adding a delay gap to the drag offset

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Draw the player as a circle
    canvas.drawCircle(const Offset(0, 0) + (size / 2).toOffset(), radius, Paint()..color = const Color.fromARGB(255, 193, 201, 236));

    // Draw the line if dragStart and dragEnd are set
    if (dragStart != null && dragEnd != null) {
      const start = Offset.zero;
      final end = dragEnd! - dragStart!;
      canvas.drawLine(
          start + (size / 2).toOffset(),
          Offset(end.dx * dragCoefficient, end.dy * dragCoefficient) + (size / 2).toOffset(),
          Paint()
            ..color = Colors.white
            ..strokeWidth = 2.0);
    }
  }

  @override
  bool containsLocalPoint(Vector2 point) {
    // Increase the touch detection radius to 20
    return (point - (size / 2)).length < radius * 4;
  }

  //Line approver
  bool lineApprover(LineDirection direction) {
    linesLimit--;
    //check if the direction is already used
    if (usedDirections.contains(direction)) {
      log('Direction already used');
      return false;
    }
    if (linesLimit == 0) {
      log('Lines limit reached');
      return false;
    }
    usedDirections.add(direction);
    log('Direction added to used directions $direction');
    return true;
  }
}

LineDirection getDirection(Offset start, Offset end) {
  final dx = end.dx - start.dx;
  final dy = end.dy - start.dy;

  if (dx.abs() > dy.abs()) {
    if (dx > 0) {
      return LineDirection.right;
    } else {
      return LineDirection.left;
    }
  } else {
    if (dy > 0) {
      return LineDirection.down;
    } else {
      return LineDirection.up;
    }
  }
}
