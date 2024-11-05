import 'package:flutter/material.dart';

class CounterValueNotifier {
  ValueNotifier<int> counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }

  void decrementCounter(BuildContext context) {
    if (counter.value > 0) {
      counter.value--;
    } else {
      counter.value = 0;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Quantidade não pode ser negativa'),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
}
