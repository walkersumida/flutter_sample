import 'package:flutter_sample/models/user.dart';

class UserResponse {
  final User data;
  final String error;

  UserResponse(this.data, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : data = User.fromJson(json),
        error = "";

  UserResponse.withError(String errorValue)
      : data = User('', '', '', '', Map()),
        error = errorValue;
}
