import 'package:flutter/material.dart';
import 'package:primeiro_app/presenter/value_notifier/count_value_notifier.dart';

class PaginaLojaValueNotifier extends StatefulWidget {
  PaginaLojaValueNotifier({super.key});

  CounterValueNotifier counterState = CounterValueNotifier();

  @override
  State<PaginaLojaValueNotifier> createState() =>
      _PaginaLojaValueNotifierState();
}

class _PaginaLojaValueNotifierState extends State<PaginaLojaValueNotifier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Super Ofertas com ValueNotifier',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent[700],
        elevation: 5,
        shadowColor: Colors.black,
        leading: const Icon(
          Icons.monetization_on_outlined,
          size: 30,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Novo Iphone 16 128gb',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Image.network(
                "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone16prohero-202409?wid=680&hei=528&fmt=p-jpg&qlt=95&.v=1725567335931"),
            const SizedBox(height: 20),
            const Text("Por apenas R\$ 100.000,00",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text(
              "Adicionar ao carrinho",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    widget.counterState.decrementCounter(context);
                  },
                  icon: const Icon(Icons.remove),
                  iconSize: 30,
                  color: Colors.white,
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(CircleBorder()),
                    backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                    elevation: MaterialStatePropertyAll(5),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    widget.counterState.incrementCounter();
                  },
                  icon: const Icon(Icons.add),
                  iconSize: 30,
                  color: Colors.white,
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(CircleBorder()),
                    backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                    elevation: MaterialStatePropertyAll(5),
                    shadowColor: MaterialStatePropertyAll(Colors.black),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  height: 50,
                  width: 100,
                  child: ValueListenableBuilder<int>(
                      valueListenable: widget.counterState.counter,
                      builder: (context, value, child) {
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.shopping_cart,
                                  color: Colors.redAccent[700]),
                              Text(
                                '$value',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
