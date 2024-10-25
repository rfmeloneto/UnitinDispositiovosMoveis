import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você está na Pagina 2'),
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
