import 'package:flutter_sample/models/post.dart';

class PostsResponse {
  final List<Post> data;
  final String error;

  PostsResponse(this.data, this.error);

  PostsResponse.fromJson(List<dynamic> json)
      : data = json.map((i) => new Post.fromJson(i)).toList(),
        error = "";

  PostsResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
