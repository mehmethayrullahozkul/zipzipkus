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
  var yAxis = 0.0;
  @override
  void update(double dt) {
    hAxis = 0;
    
    if (_leftPressed) {
      
      hAxis -= 5;
      _leftPressed = false;
    }else if (_rightPressed) {
      
      hAxis += 5;
      _rightPressed = false;
    }else if(_jumpPressed){
      yAxis = -5;
      
      _jumpPressed = false;
    
    }
    yAxis = 0;
    super.update(dt);
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if(keysPressed.contains(LogicalKeyboardKey.space)){
      _jumpPressed = true;
    }else if(keysPressed.contains(LogicalKeyboardKey.arrowRight)){
      _rightPressed = true;
    }else if(keysPressed.contains(LogicalKeyboardKey.arrowLeft)){
      _leftPressed = true;
    }
    
    return true;
  }
}
