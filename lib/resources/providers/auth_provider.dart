import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';
import 'package:flutter_sample/models/user.dart';

class AuthProvider {
  Future<User> signIn(String email, String password) async {
    Response response = await dio.post(
        '/auth/sign_in',
        data: { 'email': email, 'password': password });
    return User.fromJson(response.data);
  }

  Future<Response<dynamic>> signOut() async {
    return await dio.delete('/auth/sign_out');
  }
}
