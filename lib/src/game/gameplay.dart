import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flame/experimental.dart';
import 'package:zipzipkus/src/game/game.dart';
import 'player.dart';
import 'input.dart';

class Gameplay extends Component {
  late final double screenHeight;
  late final double screenWidth;
  Gameplay({super.key, required this.screenHeight, required this.screenWidth});
  static const id = 'Gameplay';
  late final TiledComponent map;
  // Our Camera
  late final CameraComponent cam;

  late final Player player;
  // Our Player
  //late final RedHatBoy = SpriteComponent();
  // Our level
  final double characterSize = 70.0;

  late final input = Input();

  @override
  Future<void> onLoad() async {
    print('1-1');
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    //final background = BackgroundColor();
    //await add(background);
    // Level 1 - Tile Map
    print('1-2');
    map = await TiledComponent.load('GrassLevel02.tmx', Vector2.all(16.0))
      ..debugMode = false;
    print('1-4');
    player = Player(
        position: Vector2(screenHeight * 0.05, map.size.y * 0.4),
        mapHeight: map.height)
      ..debugMode = false;
    print('1-3');
    final world2 = World(children: [map, input, player]);
    await add(world2);
    print('1');
    final aspectRatio = (screenWidth / screenHeight);
    final cam = CameraComponent.withFixedResolution(
      width: map.height * aspectRatio,
      height: map.height,
      world: world2,
    );
    await add(cam);
    print('2');
    cam.debugMode = true;
    cam.debugColor = const Color.fromARGB(255, 238, 1, 1);
    cam.setBounds(
      Rectangle.fromLTRB(
        cam.viewport.virtualSize.x / 2,
        cam.viewport.virtualSize.y / 2,
        map.width - cam.viewport.virtualSize.x / 2,
        map.height - cam.viewport.virtualSize.y / 2,
      ),
    );
    print('3');

    cam.follow(player);
    print('4');
    print("Virtual X: ${screenWidth}");
    print("Virtual Y: ${screenHeight}");
    print("Aspect: ${aspectRatio}");
    print("Virtual X: ${cam.viewport.virtualSize.x}");
    print("Virtual Y: ${cam.viewport.virtualSize.y}");
    print("Map Height: ${map.height}");
    print("Map Width: ${map.width}");
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
