import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteramazingiamges/constants/index.dart';
import 'package:flutteramazingiamges/mvp/base_state.dart';
import 'package:flutteramazingiamges/mvp/presenters/index.dart';
import 'package:flutteramazingiamges/provider/index.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseState<HomePage, HomePresenter> {
  final List<Widget> bottomTab = [
    SvgPicture.asset('assets/icons/home-outline.svg'),
    SvgPicture.asset('assets/icons/compass-outline.svg'),
    SvgPicture.asset('assets/icons/upload-outline.svg'),
    SvgPicture.asset('assets/icons/account-outline.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    print('<> HomePage :<>--------<> build');
    final provider = Provider.of<HomeProvider>(context);
    int currentTab = provider.currentTab;
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          pageSnapping: false,
          children: <Widget>[
            ProviderSetup.instance().trendingPage(),
            ProviderSetup.instance().secondPage(),
            ProviderSetup.instance().secondPage(),
            ProviderSetup.instance().secondPage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 54,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.black12,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      provider.changeTab(0);
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      width: 36,
                      height: 36,
                      child: SvgPicture.asset(
                        'assets/icons/home-outline.svg',
                        color: currentTab == 0
                            ? DEFAULT_SELECTED_ICON
                            : DEFAULT_UN_SELECTED_ICON,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      provider.changeTab(1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      width: 36,
                      height: 36,
                      child: SvgPicture.asset(
                        'assets/icons/compass-outline.svg',
                        color: currentTab == 1
                            ? DEFAULT_SELECTED_ICON
                            : DEFAULT_UN_SELECTED_ICON,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      provider.changeTab(2);
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      width: 36,
                      height: 36,
                      child: SvgPicture.asset(
                        'assets/icons/upload-outline.svg',
                        color: currentTab == 2
                            ? DEFAULT_SELECTED_ICON
                            : DEFAULT_UN_SELECTED_ICON,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      provider.changeTab(3);
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      width: 36,
                      height: 36,
                      child: SvgPicture.asset(
                        'assets/icons/account-outline.svg',
                        color: currentTab == 3
                            ? DEFAULT_SELECTED_ICON
                            : DEFAULT_UN_SELECTED_ICON,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomePresenter createPresenter() {
    return HomePresenter();
  }
}
