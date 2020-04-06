import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutteramazingiamges/constants/index.dart';
import 'package:flutteramazingiamges/mvp/models/search_by_keywork_model.dart';

import 'http_api.dart';

class DioUtils {
  static final DioUtils _singleton = DioUtils._internal();

  static DioUtils get instance => DioUtils();

  factory DioUtils() {
    return _singleton;
  }

  static Dio _dio;

  Dio getDio() {
    return _dio;
  }

  DioUtils._internal() {
    var options = BaseOptions(
      connectTimeout: HttpApi.CONNECT_TIMEOUT,
      receiveTimeout: HttpApi.RECEIVE_TIMEOUT,
//      responseType: ResponseType.plain,
      validateStatus: (status) {
        return true;
      },
      baseUrl: HttpApi.BASE_URL,
      contentType: 'application/json',
    );
    _dio = new Dio(options);
    _dio.interceptors.add(headerOption());
  }

  Future<Response> asyncRequestNetwork(
    Method method,
    String url, {
    CancelToken cancelToken,
    Function(Response res) onSuccess,
    Map<String, dynamic> queryParameters,
    Function(dynamic t) onError,
  }) async {
    try {
      Response response = await _dio.request(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      onSuccess(response);
    } catch (e) {
      onError(e);
    }
  }

  Type typeOf<T>() => T;
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data);
}

class headerOption extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.headers.addAll({'Authorization': '$API_KEY'});
    return super.onRequest(options);
  }
}

enum Method { get, post, put, patch, delete, head }
