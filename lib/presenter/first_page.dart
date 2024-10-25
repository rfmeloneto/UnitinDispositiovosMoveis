import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você está na Pagina 1'),
            ElevatedButton(
                child: const Text('Ir para a Pagina 2'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/second',
                    arguments: {
                      'title': 'Olá, você está na Página 2',
                      'text' : 'Esse texto vem da primeira página'
                      }
                  );
                }),
            ElevatedButton(
                child: const Text('Ir para a Pagina 3'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/third',
                  );
                }),
          ],
        ),
      ),
    );
  }
}
