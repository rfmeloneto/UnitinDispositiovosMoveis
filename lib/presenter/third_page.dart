import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Página 3'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você está na Pagina 3'),
            ElevatedButton(
                child: const Text('Ir para a Pagina 1'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/',
                  );
                }),
            ElevatedButton(
                child: const Text('Ir para a Pagina 2'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                }),
          ],
        )));
  }
}
