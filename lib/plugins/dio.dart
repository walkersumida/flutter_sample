import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
    baseUrl: "http://0.0.0.0:3000",
);
Dio dio = new Dio(options);
