import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    //final palette = context.watch<Palette>();
    return Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveScreen(
            mainAreaProminence: 0.2,
            squarishMainArea: Center(
              child: Transform.rotate(
                angle: -0.1,
                child: const Text(
                  'Zıp Zıp Kuş!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Permanent Marker',
                    fontSize: 45,
                    height: 1,
                  ),
                ),
              ),
            ),
            rectangularMenuArea: Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                FilledButton(
                    onPressed: () {
                      GoRouter.of(context).go('/play');
                      _doNothing();
                    },
                    child: Text('Oyna!')),
                FilledButton(
                    onPressed: () {
                      GoRouter.of(context).go('/settings');
                      _doNothing();
                    },
                    child: Text('Ayarlar'))
              ]),
            )));
  }
}
