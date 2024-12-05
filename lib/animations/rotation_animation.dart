import 'package:flutter/material.dart';

class RotationAnimationExample extends StatefulWidget {
  const RotationAnimationExample({super.key});

  @override
  _RotationAnimationExampleState createState() =>
      _RotationAnimationExampleState();
}

class _RotationAnimationExampleState extends State<RotationAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repetir a animação
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotação Explícita')),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.1415926,
              child: child,
            );
          },
          child: const Icon(Icons.sync, size: 100, color: Colors.blue),
        ),
      ),
    );
  }
}