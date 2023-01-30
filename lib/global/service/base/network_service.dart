import 'package:alice/alice.dart';
import 'package:dio/dio.dart';

final alice = Alice(showInspectorOnShake: true);

final dioOptions = BaseOptions(
  followRedirects: false,
  receiveTimeout: 10000, // 10 Seconds
  connectTimeout: 10000, // 10 Seconds
);
