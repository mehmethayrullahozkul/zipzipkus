import 'dart:async';
import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/route_names.dart';


import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:zipzipkus/src/utils/route_names.dart';
import 'game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flame/game.dart';
import 'package:flame/camera.dart';
import 'package:flame/flame.dart';
import 'package:flame/experimental.dart';

class Player extends PositionComponent
    with HasGameReference, HasAncestor<ZipZipGame> {
  Player({super.position});

  late final SpriteComponent _body;

  final _moveDirection = Vector2(0, 1);
  var _speed = 0.0;
  static const _maxSpeed = 100;
  static const _acceleration = 0.7;

  @override
  FutureOr<void> onLoad() async {
    final animationTiles = await game.images.load('ts1.png');
    final spriteSheet =
        SpriteSheet(image: animationTiles, srcSize: Vector2.all(32));

    _body = SpriteComponent(
        sprite: spriteSheet.getSprite(2, 43),
        size: Vector2.all(game.camera.viewport.virtualSize.y * 0.07),
        anchor: Anchor.center);
    await add(_body);
    return super.onLoad();
  }
  var i= 0;
  @override
  void update(double dt) {
    
    _moveDirection.x = ancestor.input.hAxis;
    _speed = lerpDouble(_speed, _maxSpeed, _acceleration)!;
    position.addScaled(_moveDirection, _speed * dt);
    
    if(this.y > 100){
      
      //print("${i} dead\n");
      i++;
    }
    super.update(dt);
  }
}
