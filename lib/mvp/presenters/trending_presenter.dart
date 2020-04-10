import 'package:flutteramazingiamges/mvp/base_page_presenter.dart';
import 'package:flutteramazingiamges/mvp/models/index.dart';
import 'package:flutteramazingiamges/net/dio_utils.dart';
import 'package:flutteramazingiamges/net/index.dart';
import 'package:flutteramazingiamges/ui/pages/index.dart';

class TrendingPresenter extends BasePagePresenter<TrendingPageState> {
  getListTrending({query: 'cat', perPage: 222, page: 1}) {
    asyncRequestNetwork(Method.get, HttpApi.CURATED_IMAGE, queryParameters: {
      'page': '$page',
      'per_page': '$perPage',
    }, onSuccess: (response) {
      CuratedPhoto curatedPhoto =
          CuratedPhoto.fromJson(Map<String, dynamic>.from(response.data));
      view.setCuratedPhotos(
        curatedPhoto.page,
        curatedPhoto.perPage,
        curatedPhoto.photos,
        curatedPhoto.nextPage,
      );
    }, onError: (error) {
      print('<> error :<>--------<> $error');
    });
  }
}
