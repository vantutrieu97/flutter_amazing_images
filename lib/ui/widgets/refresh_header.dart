import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore: non_constant_identifier_names
CustomHeader RefreshHeader() {
  return CustomHeader(
    builder: (BuildContext context, RefreshStatus mode) {
      Widget body;
      if (mode == RefreshStatus.idle) {
        body = Text('Pull down torefresh');
      } else if (mode == RefreshStatus.refreshing) {
        body = CupertinoActivityIndicator();
      } else if (mode == RefreshStatus.failed) {
        body = Text('load_failed');
      } else if (mode == RefreshStatus.canRefresh) {
        body = Text('release_to_refresh');
      } else {
        body = Container();
      }
      return Container(
        height: 44.0,
        child: Center(child: body),
      );
    },
  );
}
