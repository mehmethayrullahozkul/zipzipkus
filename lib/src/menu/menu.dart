import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../utils/responsive_screen.dart';
import '../utils/route_names.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    //final palette = context.watch<Palette>();
    return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(children: <Widget>[
          Positioned.fill(
            //
            child: Image(
              image: AssetImage('assets/img/cartoon_landscape.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          MenuLayout()
        ]));
  }
}

class MenuLayout extends StatefulWidget {
  MenuLayout({super.key});

  @override
  State<MenuLayout> createState() => _MenuLayoutState();
}

class _MenuLayoutState extends State<MenuLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.all(3.0),
              //width: 150.0,
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 208, 21)),
                      shadowColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {
                    context.pushNamed(RouteNames.game);
                  },
                  child: Image.asset(
                    'assets/img/menu_oyna2.png',
                    height: 70.0,
                  )),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.all(3.0),
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 208, 21)),
                      shadowColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {
                    context.pushNamed(RouteNames.settings);
                  },
                  child: Image.asset(
                    'assets/img/menu_ayarlar.png',
                    height: 70.0,
                  )),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.all(3.0),
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 208, 21)),
                      shadowColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {
                    context.pushNamed(RouteNames.profile);
                  },
                  child: Image.asset(
                    'assets/img/menu_profil.png',
                    height: 70.0,
                  )),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.all(3.0),
              child: FilledButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 208, 21)),
                      shadowColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {
                    //context.pushNamed(RouteNames.settings);
                    // exit
                  },
                  child: Image.asset(
                    'assets/img/menu_cikis.png',
                    height: 70.0,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
