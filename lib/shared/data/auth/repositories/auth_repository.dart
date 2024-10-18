import 'package:cryplet/core/errors/failure.dart';
import 'package:cryplet/core/exceptions/api_exception.dart';
import 'package:cryplet/core/utils/custom_types.dart';
import 'package:cryplet/shared/data/auth/api/local_auth_api.dart';
import 'package:cryplet/shared/data/auth/api/remote_auth_api.dart';
import 'package:cryplet/shared/data/auth/models/requeste/login_req.dart';
import 'package:cryplet/shared/data/auth/models/requeste/register_req.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final RemoteAuthApi _remoteAuthApi;
  final LocalAuthApi _localAuthApi;

  AuthRepository(this._remoteAuthApi, this._localAuthApi);
  ResultFuture<({String? token, UserModel? user})> login(
      {required String email, required String password}) async {
    try {
      final loginResponse = await _remoteAuthApi
          .login(LoginReq(email: email, password: password));

      return Right((user: loginResponse.user, token: loginResponse.token));
    } on ApiException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  ResultFuture<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    String? avatar,
  }) async {
    try {
      final res = await _remoteAuthApi.register(
        RegisterReq(
          username: name,
          email: email,
          password: password,
          passwordConfirm: passwordConfirm,
          avatar: avatar,
        ),
      );

      return Right(res);
    } on ApiException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  ResultFuture<UserModel> me(String id) async {
    try {
      final me = await _remoteAuthApi.me(id);
      return Right(me);
    } on ApiException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  ResultFuture<void> logout() async {
    try {
      _localAuthApi.clearApiToken();
      return const Right(null);
    } on ApiException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  void saveApiToken(String token) async {
    _localAuthApi.setApiToken(token);
  }
}
