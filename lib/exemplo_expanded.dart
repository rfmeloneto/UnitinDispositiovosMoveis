import 'package:flutter/material.dart';

class ExemploExpanded extends StatelessWidget {
  const ExemploExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exemplo Expanded")),
      body: Column(
        children: [
          Expanded(
            child: Container(color: Colors.red),
          ),
          Container(color: Colors.green,
          width: MediaQuery.sizeOf(context).width,
          height: 100,),
        ],
      ),
    );
  }
}
