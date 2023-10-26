import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:zipzipkus/src/menu/menu.dart';

import 'src/game/game.dart';
import 'src/style/transitions.dart';
import 'src/style/palette.dart';
import 'src/settings/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final _router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const MainMenu(key: Key('main menu')),
        routes: [
          GoRoute(
            path: 'play',
            pageBuilder: (context, state) => buildMyTransition<void>(
              key: ValueKey('play'),
              child: const GameScreen(
                key: Key('game'),
              ),
              color: Colors.lightGreen,
            ),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) =>
                const SettingsScreen(key: Key('settings')),
          ),
        ])
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          background: Colors.orange,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.amber,
          ),
        ),
        useMaterial3: true,
      ),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
