import 'package:dio/dio.dart';
import 'package:flutteramazingiamges/net/index.dart';

import 'base_presenter.dart';
import 'base_view.dart';

class BasePagePresenter<V extends BaseView> extends BasePresenter {
  V view;
  CancelToken _cancelToken;

  BasePagePresenter() {
    _cancelToken = CancelToken();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  }

  @override
  void didUpdateWidgets<W>(W oldWidget) {
    // TODO: implement didUpdateWidgets
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initState() {
    // TODO: implement initState
  }

  void asyncRequestNetwork(
    Method method,
    String url, {
    Map<String, dynamic> queryParameters,
    Function(Response response) onSuccess,
    Function(dynamic response) onError,
  }) async {
    await DioUtils.instance.asyncRequestNetwork(
      method,
      url,
      queryParameters: queryParameters,
      onSuccess: (response) {
        onSuccess(response);
      },
      onError: (error) {
        onError(error);
      },
    );
  }
}
