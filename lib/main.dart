import 'package:flutter/material.dart';
import 'package:primeiro_app/animation_page.dart';
import 'package:primeiro_app/animations/animated_container.dart';
import 'package:primeiro_app/animations/anumated_opacity.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: AnimationPage(AnimatedOpacityExample()),
      );
  }
  
}
