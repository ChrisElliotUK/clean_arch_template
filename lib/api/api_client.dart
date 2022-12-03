import 'package:dio/dio.dart';

import '../core/services/env.dart';

part 'endpoints.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response> get(dynamic url,
      {Map<String, dynamic>? queryParameters, CancelToken? cancelToken, Options? options}) async {
    return await _dio.get(url,
        queryParameters: queryParameters, cancelToken: cancelToken ?? defaultCancelToken, options: options);
  }

  Future<Response> post(dynamic url,
      {dynamic data, CancelToken? cancelToken, Options? options, Map<String, dynamic>? queryParameters}) async {
    return await _dio.post(url,
        data: data, cancelToken: cancelToken ?? defaultCancelToken, options: options, queryParameters: queryParameters);
  }

  Future<Response> put(dynamic url,
      {Map<dynamic, dynamic>? data,
      CancelToken? cancelToken,
      Options? options,
      Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(url,
        data: data, cancelToken: cancelToken ?? defaultCancelToken, options: options, queryParameters: queryParameters);
  }

  Future<Response> delete(dynamic url,
      {Map<dynamic, dynamic>? data,
      CancelToken? cancelToken,
      Options? options,
      Map<String, dynamic>? queryParameters}) async {
    return await _dio.delete(url,
        data: data, cancelToken: cancelToken ?? defaultCancelToken, options: options, queryParameters: queryParameters);
  }
}
