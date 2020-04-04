import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  int get counterValue => _counter;
}
