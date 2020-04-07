import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int _currentTab = 0;

  void changeTab(int tabNumber) {
    _currentTab = tabNumber;
    notifyListeners();
  }

  int get currentTab => _currentTab;
}
