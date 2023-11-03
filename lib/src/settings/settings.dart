import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/route_names.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key, this.onGoBackPressed});

  static const id = 'Settings';

  final VoidCallback? onGoBackPressed;

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
                        child: const Text('Settings Screen',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600))),
                    SizedBox(height: 50.0),
                    FilledButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 212, 19, 6)),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.all(20))),
                        onPressed: onGoBackPressed,
                        child: const Text('Go Back To Menu',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w600))),
                  ],
                )),
              ))),
    );
  }
}
