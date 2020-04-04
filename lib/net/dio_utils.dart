import 'dart:convert';

import 'package:dio/dio.dart';

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
  }

  Future<Response> asyncRequestNetwork(
    Method method,
    String url, {
    CancelToken cancelToken,
    Function(Response t) onSuccess,
    Function(dynamic t) onError,
  }) async {
    print('<> Start connection :< path>--------<> $url');
    try {
      Response response = await _dio.request(
        url,
        cancelToken: cancelToken,
      );
      onSuccess(response);
      print('<> Finished connection :<>--------<> ');
    } catch (e) {
      onError(e);
    }
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data);
}

enum Method { get, post, put, patch, delete, head }
