import 'package:flutter/material.dart';

class CounterChangeNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter(BuildContext context) {
    if (_counter > 0) {
      _counter--;
    } else {
      _counter = 0;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Quantidade não pode ser negativa'),
        backgroundColor: Colors.redAccent,
      ));
    }

    notifyListeners();
  }
}
