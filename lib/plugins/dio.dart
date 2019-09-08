import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

BaseOptions options = new BaseOptions(
    baseUrl: "http://0.0.0.0:3000",
);
Dio dio = new Dio(options);
