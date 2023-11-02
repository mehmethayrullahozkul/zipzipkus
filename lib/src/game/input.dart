import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:flutter/src/services/raw_keyboard.dart';
import 'game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flame/game.dart';
import 'package:flame/camera.dart';
import 'package:flame/flame.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/services.dart';

class Input extends Component with KeyboardHandler {
  bool _leftPressed = false;
  bool _rightPressed = false;
  bool _jumpPressed = false;

  var hAxis = 0.0;

  @override
  void update(double dt) {
    hAxis = 0;
    print("pr upd");
    if (_leftPressed) {
      print("left press");
      hAxis -= 1;
    }
    if (_rightPressed) {
      print("right press");
      hAxis += 1;
    }
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _leftPressed = true;
    _rightPressed = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);

    return super.onKeyEvent(event, keysPressed);
  }
}
