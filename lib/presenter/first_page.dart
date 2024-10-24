import 'package:flutter/material.dart';
import 'package:primeiro_app/presenter/second_page.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

