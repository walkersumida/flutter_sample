import 'dart:async';

import 'package:rxdart/subjects.dart';

import 'package:flutter_sample/models/user_response.dart';
import 'package:flutter_sample/models/user.dart';
import 'package:flutter_sample/resources/repositories/auth_repository.dart';

class AuthBloc {
  static UserResponse _user = UserResponse(User('', '', '', '', Map()), null);

  final BehaviorSubject<UserResponse> _controller =
      BehaviorSubject<UserResponse>.seeded(_user);

  Sink<UserResponse> get setUser => _controller.sink;
  Stream<UserResponse> get getUser => _controller.stream;

  void create(String email, String password) async {
    AuthRepository _authRepository = AuthRepository();
    _user = await _authRepository.signIn(email, password);
    _controller.sink.add(_user);
  }

  void dispose() {
    _controller.close();
  }
}
