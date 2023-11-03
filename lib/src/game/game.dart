import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:zipzipkus/src/game/gameplay.dart';
import '../menu/menu.dart';
import '../settings/settings.dart';
import '../game/pause_game.dart';

class ZipZipGame extends FlameGame with HasKeyboardHandlerComponents {
  late final scrHeight;
  late final scrWidth;
  late final _routes = <String, Route>{
    MainMenu.id: OverlayRoute((context, game) => MainMenu(
          onSettingsPressed: () => _routeByScreenID(SettingsScreen.id),
          onPlayPressed: () => _startGame(),
        )),
    SettingsScreen.id: OverlayRoute((context, game) => SettingsScreen(
          onGoBackPressed: _popRoute,
        )),
    PauseScreen.id: OverlayRoute((context, game) => PauseScreen(
          onResumePressed: () {},
          onRestartPressed: () {},
          onExitPressed: () {},
        )),
  };
  late final _router =
      RouterComponent(initialRoute: MainMenu.id, routes: _routes);

  @override
  FutureOr<void> onLoad() async {
    scrWidth = size[0];
    scrHeight = size[1];
    await add(_router);
    print('im back! game');
    return super.onLoad();
  }

  void _routeByScreenID(String id) {
    _router.pushNamed(id);
  }

  void _popRoute() {
    _router.pop();
  }

  void _startGame() {
    //_router.pop();
    //_router.pushNamed(Gameplay.id);
    _router.pushReplacement(
        Route(() => Gameplay(screenHeight: scrHeight, screenWidth: scrWidth)),
        name: Gameplay.id);
  }
}
