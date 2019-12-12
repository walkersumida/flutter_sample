import 'package:flutter_sample/models/posts_response.dart';
import 'package:flutter_sample/resources/providers/post_provider.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<PostsResponse> index() {
    return _postProvider.index();
  }
}
