import 'package:dio/dio.dart';
import 'package:flutter_sample/models/user_response.dart';
import 'package:flutter_sample/resources/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();

  Future<UserResponse> signIn(String email, String password) {
    return _authProvider.signIn(email, password);
  }

  Future<Response<dynamic>> signOut() {
    return _authProvider.signOut();
  }
}
