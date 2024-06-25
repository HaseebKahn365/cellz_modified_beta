import 'dart:async';
import 'package:cellz_modified_beta/business_logic/game_state.dart';
import 'package:cellz_modified_beta/game_components/gui_dot.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {
  final int xP, yP;
  Vector2 appropriateOffset;
  late final TextComponent textComponent;

  MyGame({required this.xP, required this.yP, required this.appropriateOffset})
      : super(
          camera: CameraComponent.withFixedResolution(width: 700, height: 1000),
        ) {
    debugMode = false;
    priority = 0;
    GameState.initGameCanvas(xPoints: xP, yPoints: yP);
  }

  @override
  Color backgroundColor() => Colors.black.withOpacity(0);

  @override
  FutureOr<void> onLoad() async {
    //adjust the anchor to the appropriate offset
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
    world.add(textComponent);

    for (var entry in GameState.allPoints.entries) {
      world.add(Dot(entry.value));
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
      if (camera.viewfinder.transform.position.y < -(appropriateOffset.y * GameState.gameCanvas.yPoints / 2)) {
        break;
      }
      camera.viewfinder.transform.position.add(Vector2(0, -1.0));
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> moveDown() async {
    // camera.viewfinder.transform.position.add(Vector2(0, 30));
    for (var i = 0; i < 90; i++) {
      if (camera.viewfinder.transform.position.y > (appropriateOffset.y * GameState.gameCanvas.yPoints / 2)) {
        break;
      }
      camera.viewfinder.transform.position.add(Vector2(0, 1.0));
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> moveLeft() async {
    // camera.viewfinder.transform.position.add(Vector2(-30, 0));
    for (var i = 0; i < 90; i++) {
      if (camera.viewfinder.transform.position.x < -(appropriateOffset.x * GameState.gameCanvas.xPoints / 2)) {
        break;
      }
      camera.viewfinder.transform.position.add(Vector2(-1.0, 0));
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }

  Future<void> moveRight() async {
    // camera.viewfinder.transform.position.add(Vector2(30, 0));
    for (var i = 0; i < 90; i++) {
      if (camera.viewfinder.transform.position.x > (appropriateOffset.x * GameState.gameCanvas.xPoints / 2)) {
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
