import 'package:flutter/material.dart';

class BounceAnimationExample extends StatefulWidget {
  const BounceAnimationExample({super.key});

  @override
  _BounceAnimationExampleState createState() =>
      _BounceAnimationExampleState();
}

class _BounceAnimationExampleState extends State<BounceAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    )..addListener(() {
        setState(() {});
      });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bounce Animation')),
      body: Center(
        child: Transform.scale(
          scale: _animation.value,
          child: const Icon(Icons.star, size: 100, color: Colors.yellow),
        ),
      ),
    );
  }
}
