import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';

class PostService {
  static Future<Response<dynamic>> index() {
    return dio.get('/posts');
  }
}

