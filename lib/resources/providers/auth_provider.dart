import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';

class AuthProvider {
  static Future<Response<dynamic>> signIn(String email, String password) {
    return dio.post(
        '/auth/sign_in',
        data: { 'email': email, 'password': password });
  }

  static Future<Response<dynamic>> signOut() {
    return dio.delete('/auth/sign_out');
  }
}
