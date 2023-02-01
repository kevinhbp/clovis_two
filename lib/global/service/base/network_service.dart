import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

import '../interceptor/global_interceptor.dart';

final alice = Alice(showInspectorOnShake: true);

final dioOptions = BaseOptions(
  followRedirects: false,
  receiveTimeout: 10000, // 10 Seconds
  connectTimeout: 10000, // 10 Seconds
);

class NetworkService {
  factory NetworkService() => _instance;

  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  Dio? _client;

  Dio getDioClient() {
    if (_client != null) {
      return _client!;
    }

    _client = Dio(dioOptions);
    _client!.options.headers['content-Type'] = 'application/json';
    _client!.interceptors.add(GlobalInterceptor(_client!));
    _client!.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return _client!;
  }
}
