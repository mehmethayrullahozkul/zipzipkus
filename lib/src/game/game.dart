import 'package:flame/flame.dart';
import 'package:flame/input.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/camera.dart';
import 'package:flame/experimental.dart';
import '../utils/route_names.dart';
import 'player.dart';
import 'input.dart';

class GameScreen extends StatefulWidget {
  @override
  State createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final ZipZipGame _game;

  @override
  void initState() {
    super.initState();
    _game = ZipZipGame();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: _game);
  }
}

class ZipZipGame extends FlameGame with HasKeyboardHandlerComponents {
  late final TiledComponent map;
  // Our Camera
  late final CameraComponent cam;

  late final Player player;
  // Our Player
  late final World world;
  //late final RedHatBoy = SpriteComponent();
  // Our level
  final double characterSize = 70.0;

  final input = Input();

  @override
  Future<void> onLoad() async {
    final screenWidth = size[0];
    final screenHeight = size[1];
    await Flame.device.fullScreen();
    await Flame.device.setLandscape();

    final background = BackgroundColor();
    await add(background);
    // Level 1 - Tile Map

    map = await TiledComponent.load('GrassLevel02.tmx', Vector2.all(16.0))
      ..debugMode = false;
    player =
        await Player(position: Vector2(screenHeight * 0.05, map.size.y * 0.4))
          ..debugMode = false;

    world = await World(children: [map, input, player]);
    await add(world);
    //world.add(map);

    //await add(world);

    //final world = World(children: [map]);
    //await add(world);

    //final spritesheet_jump = await fromJSONAtlas(
    //    'redhatboy_jumpsheet.png', 'redhatboy_jumpsheet.json');

    //final aspectRatio = num.parse((size[0] / size[1]).toStringAsFixed(3));

    // Tiled Map

    // Character

    //SpriteAnimation jump =
    //    SpriteAnimation.spriteList(spritesheet_jump, stepTime: 0.07);
    //RedHatBoy.sprit = await loadSprite('redhatboy_idle_01.png');

    //RedHatBoy.sprite = await loadSprite('redhatboy_idle_01.png');
    ////RedHatBoy.animation = jump;
    //RedHatBoy.size = Vector2(characterSize, characterSize);
    //RedHatBoy.x = screenWidth / 2.0 - characterSize;
    //RedHatBoy.y = (screenHeight - characterSize) / 2.0;
    //RedHatBoy.debugMode = true;
    //RedHatBoy.positionOfAnchor(Anchor.centerRight);
    //add(RedHatBoy);
  }

  @override
  void onAttach() {
    final aspectRatio = MediaQuery.of(buildContext!).size.aspectRatio;
    super.onAttach();
    cam = CameraComponent.withFixedResolution(
      width: map.height * aspectRatio,
      height: map.height,
      world: world,
    );
    cam.debugMode = true;
    cam.debugColor = Color.fromARGB(255, 238, 1, 1);
    //camera.viewfinder.anchor = Anchor.centerLeft;
    cam.setBounds(
      Rectangle.fromLTRB(
        cam.viewport.virtualSize.x / 2,
        cam.viewport.virtualSize.y / 2,
        map.width - cam.viewport.virtualSize.x / 2,
        map.height - cam.viewport.virtualSize.y / 2,
      ),
    );
    this.camera = cam;
    cam.follow(player);
    print("Virtual X: ${cam.viewport.virtualSize.x / 2.0}");
    print("Virtual Y: ${cam.viewport.virtualSize.y / 2.0}");
    print("Map Height: ${map.height}");
    print("Map Width: ${map.width}");
    //camera.setBounds(
    //  Rectangle.fromLTRB(
    //    camera.viewport.virtualSize.x / 2,
    //    camera.viewport.virtualSize.y / 2,
    //    map.width - camera.viewport.virtualSize.x / 2,
    //    map.height - camera.viewport.virtualSize.y / 2,
    //  ),
    //);
  }
  //if (screenWidth >= fixedResolution.x) {
  //  cam.moveTo(Vector2(fixedResolution.x / 2.0, map.height / 2));
  //} else {
  //  cam.moveTo(Vector2(fixedResolution.x / 2.0, map.height / 2));
  //}

  //cam.moveTo(Vector2(0.0, 0.0));
  //cam.follow(RedHatBoy);
  @override
  void update(double dt) {
    super.update(dt);
  }
}

//class ZipZipGame extends FlameGame {
//  late final TiledComponent level;
//
//  @override
//  Future<void> onLoad() async {
//    level = await TiledComponent.load(
//      "GrassLevel01.tmx",
//      Vector2.all(16),
//    );
//
//    world.add(level);
//  }
//
//  @override
//  void onAttach() {
//    final aspectRatio = MediaQuery.of(buildContext!).size.aspectRatio;
//    super.onAttach();
//    camera = CameraComponent.withFixedResolution(
//      width: level.height * aspectRatio,
//      height: level.height,
//      world: world,
//    );
//
//    camera.setBounds(
//      Rectangle.fromLTRB(
//        camera.viewport.virtualSize.x / 2,
//        camera.viewport.virtualSize.y / 2,
//        level.width - camera.viewport.virtualSize.x / 2,
//        level.height - camera.viewport.virtualSize.y / 2,
//      ),
//    );
//  }
//}

class BackgroundColor extends Component {
  @override
  void render(Canvas canvas) {
    final backgroundPaint = Paint()
      ..color = Color.fromARGB(
          255, 195, 245, 255); // Set your desired background color
    canvas.drawRect(Rect.fromLTWH(0, 0, 1200, 800 * 2), backgroundPaint);
  }
}
