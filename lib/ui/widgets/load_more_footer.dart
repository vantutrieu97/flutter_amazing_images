import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CustomFooter LoadMoreFooter() {
  return CustomFooter(
    builder: (BuildContext context, LoadStatus mode) {
      Widget body;
      if (mode == LoadStatus.idle) {
        body = Text("Pull up to load more");
      } else if (mode == LoadStatus.loading) {
        body = CupertinoActivityIndicator();
      } else if (mode == LoadStatus.failed) {
        body = Text("Load Failed!Click retry!");
      } else if (mode == LoadStatus.canLoading) {
        body = Text("release to load more");
      } else {
        body = Text("No more Data");
      }
      return Container(
        height: 44.0,
        child: Center(child: body),
      );
    },
  );
}
