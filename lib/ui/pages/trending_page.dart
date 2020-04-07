import 'package:flutter/material.dart';
import 'package:flutteramazingiamges/mvp/base_state.dart';
import 'package:flutteramazingiamges/mvp/presenters/index.dart';

class TrendingPage extends StatefulWidget {
  @override
  TrendingPageState createState() => TrendingPageState();
}

class TrendingPageState extends BaseState<TrendingPage, TrendingPresenter> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  TrendingPresenter createPresenter() {
    // TODO: implement createPresenter
    return TrendingPresenter();
  }
}
