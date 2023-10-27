import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/route_names.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      child: const Text('Settings Screen',
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
            )));
  }
}
