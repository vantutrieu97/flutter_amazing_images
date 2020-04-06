import 'package:flutteramazingiamges/mvp/base_page_presenter.dart';
import 'package:flutteramazingiamges/mvp/models/search_by_keywork_model.dart';
import 'package:flutteramazingiamges/net/index.dart';
import 'package:flutteramazingiamges/ui/pages/index.dart';

class SecondPagePresenter extends BasePagePresenter<SecondPageState> {
  void incrementCounter() {
    view.setCounter();
  }

  getPhotoBySearch({query: 'cat', perPage: 12, page: 1}) {
    asyncRequestNetwork(
      Method.get,
      HttpApi.SEARCH,
      queryParameters: {
        'query': '$query',
        'per_page': '$perPage',
        'page': '$page'
      },
      onSuccess: (response) {
        SearchByKeyWord searchByKeyWord =
            SearchByKeyWord.fromJson(Map<String, dynamic>.from(response.data));
        view.searchDataFromSearch(
          searchByKeyWord.totalResults,
          searchByKeyWord.page,
          searchByKeyWord.perPage,
          searchByKeyWord.photos,
          searchByKeyWord.nextPage,
        );
      },
      onError: (error) {
        print('<> SecondPagePresenter :<>--------<> onError' + error);
      },
    );
  }
}
