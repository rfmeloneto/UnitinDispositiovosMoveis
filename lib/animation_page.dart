import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  final Widget animatedWidget;
  const AnimationPage(this.animatedWidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return animatedWidget;
  }
}