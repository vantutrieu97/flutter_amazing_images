import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutteramazingiamges/mvp/base_state.dart';
import 'package:flutteramazingiamges/mvp/models/index.dart';
import 'package:flutteramazingiamges/mvp/presenters/second_page_presenter.dart';
import 'package:flutteramazingiamges/provider/index.dart';
import 'package:flutteramazingiamges/ui/widgets/display_basic_info_of_photo.dart';
import 'package:flutteramazingiamges/ui/widgets/index.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends BaseState<SecondPage, SecondPagePresenter> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int _page = 1;
  int _totalPages;
  double _screenWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter.getPhotoBySearch();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width - 12;
    final provider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Container(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: !(_page == _totalPages),
          header: WaterDropHeader(),
          footer: LoadMoreFooter(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemBuilder: (context, index) {
              Photo photo = provider.photos[index];
              return DisplayBasicInfoOfPhoto(photo, _screenWidth);
            },
            itemCount: provider.photos.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          presenter.getPhotoBySearch();
//          presenter.incrementCounter();
        },
        child:  SvgPicture.asset(
          'assets/icons/reload.svg',
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void setCounter() {
    final provider = Provider.of<CounterProvider>(context, listen: false);
    provider.incrementCounter();
  }

  void searchDataFromSearch(int totalResults, int page, int perPage,
      List<Photo> photos, String nextPageURL) {
    final provider = Provider.of<CounterProvider>(context, listen: false);
    _totalPages = totalResults ~/ perPage;
    _page = page;
    if (_page == 1 && _refreshController.isRefresh) {
      _refreshController.refreshCompleted();
    }
    provider.setListPhotosBySearch(
      totalResults,
      page,
      perPage,
      photos,
      nextPageURL,
    );
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    _page = 1;
    presenter.getPhotoBySearch(page: _page);
  }

  void _onLoading() async {
    _page += 1;
    presenter.getPhotoBySearch(page: _page);
  }

  @override
  SecondPagePresenter createPresenter() {
    return SecondPagePresenter();
  }

  loadMoreFooter() {
    print('<> loadMoreFooter :<>--------<> ');
    _refreshController.loadComplete();
//    _page += 1;
//    presenter.getPhotoBySearch(page: _page);
  }
}
