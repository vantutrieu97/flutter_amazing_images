import 'package:flutter/cupertino.dart';
import 'package:flutteramazingiamges/mvp/models/index.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  int _totalResult;
  int _perPage;
  int _page;
  String _nextPageURL;
  List<Photo> _photos = [];

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void setListPhotosBySearch(
    int totalResults,
    int page,
    int perPage,
    List<Photo> photos,
    String nextPageURL,
  ) {
    if (page == 1) {
      _photos.clear();
    };
    _totalResult = totalResults;
    _page = page;
    _perPage = perPage;
    _photos.addAll(photos);
    _nextPageURL = nextPageURL;
    notifyListeners();
  }

  int get counterValue => _counter;

  int get totalResults => _totalResult;

  int get page => _page;

  int get perPage => _perPage;

  List<Photo> get photos => _photos;

  String get nextPageURL => _nextPageURL;
}
