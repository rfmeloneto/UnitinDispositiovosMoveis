import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0; //declaramos a variável
  @override
  Widget build(BuildContext context) {
    //criamos o widget no build
    return MaterialApp(
      // Root widget
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          centerTitle: true,
          elevation: 3.0,
          shadowColor: Colors.blue[100],
          title: const Text('Contador de Cliques'),
        ),
        body: Center(
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //atribuimos a variável ao Text com a conversão .toString()
                  Text(contador.toString()),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          //Chamamos o setState que no ciclo de vida
                          // atualiza o estado do widget.
                          contador++;
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //Mudamos o texto e o ícone
                        children: [Text('Incrementar'), Icon(Icons.plus_one)],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
