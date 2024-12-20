import 'package:flutter/material.dart';

class ExemploSingleChildScrollView extends StatefulWidget {
  const ExemploSingleChildScrollView({super.key});

  @override
  State<ExemploSingleChildScrollView> createState() => _ExemploSingleChildScrollViewState();
}

class _ExemploSingleChildScrollViewState extends State<ExemploSingleChildScrollView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exemplo de SingleChildScrollView")),
      body: SingleChildScrollView(
        child: Column(
          children:
            List.generate(100, (index){
              return ListTile(
                title: Text("Item $index"),
                tileColor: Colors.primaries[index % Colors.primaries.length],
                
              );
            }),
        ),
      ),
    );
  }
}