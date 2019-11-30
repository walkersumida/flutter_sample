import 'package:flutter_sample/models/user_response.dart';
import 'package:flutter_sample/resources/repositories/auth_repository.dart';

class AuthBloc {
  Future<UserResponse> login(String email, String password) {
    AuthRepository _authRepository = AuthRepository();
    return _authRepository.signIn(email, password);
  }
}
