import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

import '../utils/route_names.dart';

class ZipZipGame extends FlameGame {
  late SpriteAnimationComponent RedHatBoy;
  SpriteComponent background = SpriteComponent();
  final double characterSize = 70.0;
  @override
  Future<void> onLoad() async {
    super.onLoad();

    final spritesheet_jump = await fromJSONAtlas(
        'redhatboy_jumpsheet.png', 'redhatboy_jumpsheet.json');
    final screenWidth = size[0];
    final screenHeight = size[1];

    // adding background

    add(background
      ..sprite = await loadSprite("cartoon_landscape.jpg")
      ..size = size);
    print("loading game assets here");

    SpriteAnimation jump =
        SpriteAnimation.spriteList(spritesheet_jump, stepTime: 0.07);
    //RedHatBoy.sprit = await loadSprite('redhatboy_idle_01.png');

    RedHatBoy = SpriteAnimationComponent();
    RedHatBoy.animation = jump;
    RedHatBoy.size = Vector2(characterSize, characterSize);
    RedHatBoy.x = (screenWidth - characterSize) / 2.0;
    RedHatBoy.y = (screenHeight - characterSize) / 2.0;
    add(RedHatBoy);
  }

  @override
  void update(double dt) {
    super.update(dt);
    RedHatBoy.x += 0.2;
  }
}

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




/*

child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 244, 244, 244)),
            child: Scaffold(
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Game Screen',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600))),
                  ElevatedButton(
                      onPressed: () {
                        // context.go("/");
                        context.goNamed(RouteNames.menu);
                      },
                      child: const Text('Go Back To Menu',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600))),
                ],
              )),
            ))


*/