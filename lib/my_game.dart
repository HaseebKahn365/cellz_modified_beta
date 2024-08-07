import 'dart:async';
import 'package:cellz_modified_beta/business_logic/game_state.dart';
import 'package:cellz_modified_beta/custom_components/custom_gui_dot.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  final int xP, yP;

  final Size screenSize;
  late final TextComponent textComponent;
  //we will create a background rectangle behind all the dots so that the map is visible.
  late final RoundedRectangleComponent backgroundComponent;

  MyGame({required this.xP, required this.yP, required this.screenSize})
      : super(
        // camera: CameraComponent.withFixedResolution(width: 1080 / 1.7, height: 1940 / 1.7),
        ) {
    debugMode = false;
    priority = 0;
    GameState.initGameCanvas(xPoints: xP, yPoints: yP);
  }

  late final double globalOffsetLocalCopy;

  @override
  Color backgroundColor() => Colors.black.withOpacity(0);

  @override
  FutureOr<void> onLoad() async {
    final screenWidth = screenSize.width * 1.2;
    final screenHeight = screenSize.height;
    globalOffsetLocalCopy = GameState.globalOffset = (screenWidth / xP).clamp(30, 150);

    // Set camera resolution based on screen size
    camera = CameraComponent.withFixedResolution(
      width: screenWidth,
      height: screenHeight,
    );

    camera.viewfinder.anchor = Anchor.topLeft;

    textComponent = TextComponent(
      text: GameState.myTurn ? 'Your Turn' : 'AI Turn',
      anchor: Anchor.topCenter,
      position: Vector2(350, 10), // Centered horizontally
      textRenderer: TextPaint(
          style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      )),
    );

    //the rectangle component will have the widthh of no of xpoint  * appropriateOffset.x and height of no of ypoints  * appropriateOffset.y
    // backgroundComponent = RoundedRectangleComponent(
    //   size: Vector2(xP * globalOffsetLocalCopy, yP * globalOffsetLocalCopy),
    //   position: Vector2(0, 0),
    //   paint: Paint()..color = GameState.colorSet[0].withOpacity(0.4),
    //   borderRadius: 50,
    // );

    backgroundComponent = RoundedRectangleComponent(
      size: Vector2(xP * globalOffsetLocalCopy, yP * globalOffsetLocalCopy),
      position: Vector2(0, 0),
      paint: Paint()..color = Colors.black.withOpacity(0.0),
      borderRadius: 0,
    );
    world.add(backgroundComponent);

    world.add(textComponent);

    for (var entry in GameState.allPoints.entries) {
      world.add(CustomGuiDot(
        myPoint: entry.value,
      ));
    }
  }

  @override
  void update(double dt) {
    textComponent.text = GameState.myTurn ? 'My Turn' : 'Ai Turn';
    super.update(dt);
  }

  // Smooth zoom implementation

  Future<void> zoomIn() async {
    for (var i = 0; i < 120; i++) {
      camera.viewfinder.zoom = (camera.viewfinder.zoom * 1.001).clamp(0.7, 3.0);
      await Future.delayed(const Duration(milliseconds: 5));
    }
  }

  Future<void> zoomOut() async {
    for (var i = 0; i < 120; i++) {
      camera.viewfinder.zoom = (camera.viewfinder.zoom * 0.999).clamp(0.7, 3.0);
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  // Camera movement methods
  Future<void> moveUp() async {
    // camera.viewfinder.transform.position.add(Vector2(0, -30));
    for (var i = 0; i < 90; i++) {
      if (camera.viewfinder.transform.position.y < -(globalOffsetLocalCopy * yP / 2)) {
        break;
      }
      camera.viewfinder.transform.position.add(Vector2(0, -1.0));
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> moveDown() async {
    // camera.viewfinder.transform.position.add(Vector2(0, 30));
    for (var i = 0; i < 90; i++) {
      if (camera.viewfinder.transform.position.y > (globalOffsetLocalCopy * yP / 2)) {
        break;
      }
      camera.viewfinder.transform.position.add(Vector2(0, 1.0));
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> moveLeft() async {
    // camera.viewfinder.transform.position.add(Vector2(-30, 0));
    for (var i = 0; i < 90; i++) {
      if (camera.viewfinder.transform.position.x < -(globalOffsetLocalCopy * xP / 2)) {
        break;
      }
      camera.viewfinder.transform.position.add(Vector2(-1.0, 0));
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> moveRight() async {
    // camera.viewfinder.transform.position.add(Vector2(30, 0));
    for (var i = 0; i < 90; i++) {
      if (camera.viewfinder.transform.position.x > (globalOffsetLocalCopy * xP / 2)) {
        break;
      }
      camera.viewfinder.transform.position.add(Vector2(1.0, 0));
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> resetZoom() async {
    print('Resetting zoom');
    // camera.viewfinder.zoom = 1.0;

    //making the transition smooth
    final iterations = (camera.viewfinder.zoom - 1) / 0.01;
    print('Total iterations: $iterations');
    for (var i = 0; i < iterations; i++) {
      camera.viewfinder.transform.position = Vector2(0, 0);
      camera.viewfinder.zoom = (camera.viewfinder.zoom - 0.01).clamp(0.7, 3.0);
      await Future.delayed(const Duration(milliseconds: 5));
    }

    //also make the offset back to the original position
  }
}

class RoundedRectangleComponent extends PositionComponent {
  final Paint paint;
  final double borderRadius;

  RoundedRectangleComponent({
    required Vector2 size,
    required Vector2 position,
    required this.paint,
    required this.borderRadius,
  }) : super(size: size, position: position);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromLTWH(0, 0, size.x, size.y);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(0));
    canvas.drawRRect(rrect, paint);
  }
}
