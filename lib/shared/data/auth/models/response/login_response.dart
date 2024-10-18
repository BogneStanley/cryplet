import 'package:cryplet/shared/data/auth/models/user_model.dart';

class LoginResponse {
  final String? token;
  final UserModel? user;

  LoginResponse({
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      user: UserModel.fromJson(json['record']),
    );
  }
}
