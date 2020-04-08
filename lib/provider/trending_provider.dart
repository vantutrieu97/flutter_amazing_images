import 'package:flutter/cupertino.dart';
import 'package:flutteramazingiamges/mvp/models/index.dart';

class TrendingProvider extends ChangeNotifier {
  int _page;
  int _perPage;
  String _nextPageURL;
  List<Photo> _photos = [];

  void setCuratedPhotos(
    int page,
    int perPage,
    List<Photo> photos,
    String nextPageURL,
  ) {
    if (page == 1) {
      _photos.clear();
    }
    _page = page;
    _perPage = perPage;
    _photos.addAll(photos);
    _nextPageURL = nextPageURL;
    print('<> Xets cong trong provider :<>--------<> ');
    notifyListeners();
  }

  List<Photo> get curatedPhotos => _photos;
}
