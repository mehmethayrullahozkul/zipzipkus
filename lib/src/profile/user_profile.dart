import 'package:flutter/material.dart';


class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

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
                      child: const Text('User Profile Screen',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600))),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Go Back To Menu',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w600))),
                ],
              )),
            )));
  }
}
