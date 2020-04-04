import 'package:flutter/material.dart';

import 'base_page_presenter.dart';
import 'base_view.dart';

abstract class BaseState<T extends StatefulWidget, V extends BasePagePresenter>
    extends State<T> implements BaseView {
  V presenter;

  BaseState() {
    presenter = createPresenter();
    presenter.view = this;
  }

  V createPresenter();

  @override
  BuildContext getContext() {
    return context;
  }
}
