import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/route_names.dart';


import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:zipzipkus/src/game/gameplay.dart';

class Player extends PositionComponent
    with HasGameReference, HasAncestor<Gameplay> {
  late final mapHeight;
  Player({super.position, required this.mapHeight});

  late final SpriteComponent _body;

  final _moveDirection = Vector2(0, 0);
  var _speed = 0.0;
  static const _maxSpeed = 160;
  static const _acceleration = 1.0;

  @override
  FutureOr<void> onLoad() async {
    final animationTiles = await game.images.load('ts1.png');
    final spriteSheet =
        SpriteSheet(image: animationTiles, srcSize: Vector2.all(32));

    _body = SpriteComponent(
        sprite: spriteSheet.getSprite(2, 43),
        size: Vector2.all(mapHeight * 0.07),
        anchor: Anchor.center);
    print(game.camera.viewport.virtualSize.y);
    await add(_body);
    return super.onLoad();
  }
  var i= 0;
  @override
  void update(double dt) {
    
    _moveDirection.x = ancestor.input.hAxis;
    _moveDirection.y = ancestor.input.yAxis;
    angle = _moveDirection.screenAngle() + pi;
    _speed = lerpDouble(_speed, _maxSpeed, _acceleration)!;
    position.addScaled(_moveDirection, _speed * dt);
    
    if(this.y > 100){
      
      //print("${i} dead\n");
      i++;
    }
    super.update(dt);
  }
}
