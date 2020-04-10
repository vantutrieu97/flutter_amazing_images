import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteramazingiamges/constants/index.dart';
import 'package:flutteramazingiamges/mvp/base_state.dart';
import 'package:flutteramazingiamges/mvp/models/index.dart';
import 'package:flutteramazingiamges/mvp/presenters/index.dart';
import 'package:flutteramazingiamges/provider/index.dart';
import 'package:flutteramazingiamges/ui/widgets/display_basic_info_of_photo.dart';
import 'package:flutteramazingiamges/ui/widgets/index.dart';
import 'package:flutteramazingiamges/ui/widgets/photo_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TrendingPage extends StatefulWidget {
  @override
  TrendingPageState createState() => TrendingPageState();
}

class TrendingPageState extends BaseState<TrendingPage, TrendingPresenter> {
  double _screenWidth = 0;
  int _page = 1;
  int _totalPages;
  String _nextPageURL;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    presenter.getListTrending();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    final provider = Provider.of<TrendingProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/magnify.svg',
                  width: 36,
                  height: 36,
                  fit: BoxFit.contain,
                  color: DEFAULT_UN_SELECTED_ICON,
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for free photos and videos...'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black12,
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: false,
              enablePullUp: !(_page == _totalPages),
              header: WaterDropHeader(),
              footer: LoadMoreFooter(),
              onLoading: _onLoading,
              onRefresh: _onRefresh,
              child: provider.curatedPhotos.length < 1
                  ? ListShimmerPhotos()
                  : TrendingPhotos(provider),
            )),
      ),
    );
  }

  ListView TrendingPhotos(TrendingProvider provider) {
    return ListView.builder(
      itemCount: provider.curatedPhotos.length,
      itemBuilder: (context, index) {
        Photo photo = provider.curatedPhotos[index];
        if (index == 0) {
          return Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Text(
                    'Trending',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.blue,
                      letterSpacing: 1.6
                    ),
                  )),
              DisplayBasicInfoOfPhoto(photo)
            ],
          );
        } else {
          return DisplayBasicInfoOfPhoto(photo);
        }
        ;
      },
    );
  }

  ListView ListShimmerPhotos() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return PhotoShimmer();
      },
    );
  }

  void setCuratedPhotos(
    int page,
    int perPage,
    List<Photo> photos,
    String nextPageURL,
  ) {
    final provider = Provider.of<TrendingProvider>(context, listen: false);
    _page = page;
    if (_page == 1 && _refreshController.isRefresh) {
      _refreshController.refreshCompleted();
    }
    provider.setCuratedPhotos(
      page,
      perPage,
      photos,
      nextPageURL,
    );
    _refreshController.loadComplete();
  }

  void _onRefresh() async {
    _page = 1;
    presenter.getListTrending(page: _page);
  }

  void _onLoading() async {
    _page += 1;
    presenter.getListTrending(page: _page);
  }

  loadMoreFooter() {
    print('<> loadMoreFooter :<>--------<> ');
    _refreshController.loadComplete();
//    _page += 1;
//    presenter.getPhotoBySearch(page: _page);
  }

  @override
  TrendingPresenter createPresenter() {
    // TODO: implement createPresenter
    return TrendingPresenter();
  }
}
