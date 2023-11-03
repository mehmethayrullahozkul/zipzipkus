import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/route_names.dart';

class PauseScreen extends StatelessWidget {
  PauseScreen({super.key, required this.onResumePressed, required this.onRestartPressed, required this.onExitPressed});

  static const id = 'Pause';

  final VoidCallback? onResumePressed;
  final VoidCallback? onRestartPressed;
  final VoidCallback? onExitPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 1, 1),
      body: SafeArea(
          child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 151, 5, 5)),
              child: Scaffold(
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 212, 19, 6)),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.all(20))),
                        onPressed: () {},
                        child: const Text('Pause Screen',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600))),
                    SizedBox(height: 50.0),
                    FilledButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 212, 19, 6)),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.all(20))),
                        onPressed: onResumePressed,
                        child: const Text('Resume',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600))),
                    FilledButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 212, 19, 6)),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.all(20))),
                        onPressed: onRestartPressed,
                        child: const Text('Restart',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600))),
                    FilledButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 212, 19, 6)),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.all(20))),
                        onPressed: onExitPressed,
                        child: const Text('Exit',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600))),
                  ],
                )),
              ))),
    );
  }
}
