import 'dart:async';

import 'package:rxdart/subjects.dart';

import 'package:flutter_sample/models/posts_response.dart';
import 'package:flutter_sample/resources/repositories/post_repository.dart';

class PostBloc {
  static PostsResponse _posts = PostsResponse([], null);

  final BehaviorSubject<PostsResponse> _postsController =
      BehaviorSubject<PostsResponse>.seeded(_posts);

  Sink<PostsResponse> get setPosts => _postsController.sink;
  Stream<PostsResponse> get getPosts => _postsController.stream;

  void index() async {
    PostRepository _postRepository = PostRepository();
    _posts = await _postRepository.index();
    _postsController.sink.add(_posts);
  }

  void dispose() {
    _postsController.close();
  }
}
