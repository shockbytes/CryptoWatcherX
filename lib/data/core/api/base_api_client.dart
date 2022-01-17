

import 'package:dio/dio.dart';

class BaseApiClient {

  static Dio _dio = Dio();

  BaseApiClient._();

  static Future<T> get<T>(String url, {Map<String, dynamic>? query}) {
    return _dio.get<T>(url, queryParameters: query)
        .then((value) => value.data!);
  }

}