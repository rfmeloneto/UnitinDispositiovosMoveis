import 'package:flutter/material.dart';

class ExemploMediaQuery extends StatelessWidget {
  const ExemploMediaQuery({super.key});

  @override
  Widget build(BuildContext context) {
    final tamanhoTela = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Exemplo de MediaQuery")),
      body: Center(
        child: Container(
          width: tamanhoTela.width * 0.8,
          height: tamanhoTela.height * 0.2,
          color: Colors.blue,
          child: Center(
            child: Text(
              "Largura: ${tamanhoTela.width.toStringAsFixed(2)}\n"
              "Altura: ${tamanhoTela.height.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
