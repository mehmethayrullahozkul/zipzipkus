import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'src/game/game.dart';

void main() {
  runApp(const ZipZipGameApp());
}

class ZipZipGameApp extends StatelessWidget {
  const ZipZipGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget.controlled(gameFactory: ZipZipGame.new),
    );
  }
}
