import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu(
      {super.key,
      this.onPlayPressed,
      this.onSettingsPressed,
      this.onProfilePressed,
      this.onExitPressed});

  static const id = 'MainMenu';

  final VoidCallback? onPlayPressed;
  final VoidCallback? onSettingsPressed;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onExitPressed;

  @override
  Widget build(BuildContext context) {
    //final palette = context.watch<Palette>();
    return Scaffold(
        backgroundColor: /* Colors.green, */ Colors.transparent,
        body: Stack(children: <Widget>[
          const Positioned.fill(
            //
            child: Image(
              image: AssetImage('assets/images/cartoon_landscape.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          MenuLayout(
            onPlay: onPlayPressed,
            onSettings: onSettingsPressed,
            onProfile: onProfilePressed,
            onExit: onExitPressed,
          )
        ]));
  }
}

class MenuLayout extends StatelessWidget {
  final VoidCallback? onPlay;
  final VoidCallback? onSettings;
  final VoidCallback? onProfile;
  final VoidCallback? onExit;
  const MenuLayout(
      {super.key,
      required this.onPlay,
      required this.onSettings,
      required this.onProfile,
      required this.onExit});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              margin: const EdgeInsets.all(3.0),
              //width: 150.0,
              child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 208, 21)),
                      shadowColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: onPlay,
                  child: Image.asset(
                    'assets/images/menu_oyna2.png',
                    height: 70.0,
                  )),
            ),
            Container(
              color: Colors.transparent,
              margin: const EdgeInsets.all(3.0),
              child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 208, 21)),
                      shadowColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: onSettings,
                  child: Image.asset(
                    'assets/images/menu_ayarlar.png',
                    height: 70.0,
                  )),
            ),
            Container(
              color: Colors.transparent,
              margin: const EdgeInsets.all(3.0),
              child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 208, 21)),
                      shadowColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () {},
                  child: Image.asset(
                    'assets/images/menu_profil.png',
                    height: 70.0,
                  )),
            ),
            Container(
              color: Colors.transparent,
              margin: const EdgeInsets.all(3.0),
              child: FilledButton(
                  style: const ButtonStyle(
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
                    'assets/images/menu_cikis.png',
                    height: 70.0,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
