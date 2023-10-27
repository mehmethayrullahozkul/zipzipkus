import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zipzipkus/src/menu/menu.dart';

import 'src/game/game.dart';
import 'src/utils/transitions.dart';
import 'src/settings/settings.dart';
import 'src/utils/route_names.dart';
import 'src/profile/user_profile.dart';
import 'src/error/error_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final _router =
      GoRouter(errorBuilder: (context, state) => ErrorScreen(), routes: [
    GoRoute(
        name: RouteNames.menu,
        path: '/',
        builder: (context, state) => const MainMenu(key: Key('main menu')),
        routes: [
          GoRoute(
            name: RouteNames.game,
            path: 'game',
            pageBuilder: (context, state) => buildMyTransition<void>(
              key: const ValueKey('game'),
              child: const GameScreen(
                key: Key('game'),
              ),
              color: Colors.lightGreen,
            ),
          ),
          GoRoute(
            name: RouteNames.settings,
            path: 'settings',
            builder: (context, state) =>
                const SettingsScreen(key: Key('settings')),
          ),
          GoRoute(
            name: RouteNames.profile,
            path: 'profile',
            builder: (context, state) =>
                const UserProfileScreen(key: Key('profile')),
          ),
        ])
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Zıp Zıp Kuş',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
          background: Colors.orange,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.amber,
          ),
        ),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
