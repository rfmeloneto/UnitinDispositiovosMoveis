import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Recebendo os argumentos passados pela rota
    final args = ModalRoute.of(context)!.settings.arguments
        as Map; //Argumentos passados pela rota no tipo Map
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(args['title']),
            Text(args['text']),
            ElevatedButton(
                child: const Text('Ir para a Pagina 1'),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/',
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
