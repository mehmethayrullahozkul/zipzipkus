import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 244, 244, 244)),
            child: Scaffold(
              body: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        _doNothing();
                      },
                      child: const Text('Settings Screen',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600)))),
            )));
  }
}
