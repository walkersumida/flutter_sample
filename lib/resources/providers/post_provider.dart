import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';
import 'package:flutter_sample/models/posts_response.dart';
import 'package:flutter_sample/resources/providers/handle_error.dart';

class PostProvider {
  Future<PostsResponse> index() async {
    try {
      Response response = await dio.get('/posts');
      return PostsResponse.fromJson(response.data);
    } on DioError catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return PostsResponse.withError(HandleError().errorDescription(error));
    }
  }
}
