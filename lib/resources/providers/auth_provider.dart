import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';
import 'package:flutter_sample/models/user_response.dart';
import 'package:flutter_sample/resources/providers/handle_error.dart';

class AuthProvider {
  Future<UserResponse> signIn(String email, String password) async {
    try {
      Response response = await dio.post(
          '/auth/sign_in',
          data: { 'email': email, 'password': password });
      return UserResponse.fromJson(response.data);
    } on DioError catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError(HandleError().errorDescription(error));
    }
  }

  Future<Response<dynamic>> signOut() async {
    return await dio.delete('/auth/sign_out');
  }
}
