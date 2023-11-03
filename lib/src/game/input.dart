import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/services.dart';

class Input extends Component with KeyboardHandler, HasGameReference {
  bool _leftPressed = false;
  bool _rightPressed = false;
  bool _upPressed = false;
  bool _downPressed = false;
  bool _jumpPressed = false;

  var _leftInput = 0.0;
  var _rightInput = 0.0;

  var _upInput = 0.0;
  var _downInput = 0.0;

  static const _sensivity = 2.0;

  var hAxis = 0.0;
  var yAxis = 0.0;
  @override
  void update(double dt) {
    _leftInput = lerpDouble(_leftInput, _leftPressed ? 1 : 0, _sensivity * dt)!;
    _rightInput =
        lerpDouble(_rightInput, _rightPressed ? 1 : 0, _sensivity * dt)!;

    _upInput = lerpDouble(_upInput, _upPressed ? 1 : 0, _sensivity * dt)!;
    _downInput =
        lerpDouble(_downInput, _downPressed ? 1 : 0, _sensivity * dt)!;
    hAxis = _rightInput - _leftInput;
    yAxis =  _downInput - _upInput;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _leftPressed = keysPressed.contains(LogicalKeyboardKey.keyA) ||
        keysPressed.contains(LogicalKeyboardKey.arrowLeft);
    _rightPressed = keysPressed.contains(LogicalKeyboardKey.keyD) ||
        keysPressed.contains(LogicalKeyboardKey.arrowRight);
    _upPressed = keysPressed.contains(LogicalKeyboardKey.keyW) ||
        keysPressed.contains(LogicalKeyboardKey.arrowUp);
    _downPressed = keysPressed.contains(LogicalKeyboardKey.keyS) ||
        keysPressed.contains(LogicalKeyboardKey.arrowDown);
    _jumpPressed = keysPressed.contains(LogicalKeyboardKey.space);

    return super.onKeyEvent(event, keysPressed);
  }
}
