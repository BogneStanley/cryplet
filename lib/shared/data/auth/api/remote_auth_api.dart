import 'package:cryplet/core/exceptions/api_exception.dart';
import 'package:cryplet/core/services/dio_wrapper/dio_init.dart';
import 'package:cryplet/shared/data/auth/models/requeste/login_req.dart';
import 'package:cryplet/shared/data/auth/models/response/login_response.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';
import 'package:dio/dio.dart';

import '../models/requeste/register_req.dart';

class RemoteAuthApi {
  final Dio _dio;

  RemoteAuthApi(AppApiWrapper dio) : _dio = dio.getAppDio();

  Future<LoginResponse> login(LoginReq loginReq) async {
    try {
      final response = await _dio.post(
        '/collections/users/auth-with-password',
        data: {
          'identity': loginReq.email,
          'password': loginReq.password,
        },
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw ApiException('Something went wrong!');
    }
  }

  Future<UserModel> me(String id) async {
    try {
      final response = await _dio.get('/collections/users/records/$id');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ApiException(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw ApiException('Something went wrong!');
    }
  }

  Future<UserModel> register(RegisterReq registerReq) async {
    try {
      final response = await _dio.post('/collections/users/records',
          data: FormData.fromMap({
            'username': registerReq.username,
            'email': registerReq.email,
            'password': registerReq.password,
            'passwordConfirm': registerReq.passwordConfirm,
            if (registerReq.avatar != null)
              'avatar': await MultipartFile.fromFile(registerReq.avatar!),
          }));

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response);
      throw ApiException(e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw ApiException('Something went wrong!');
    }
  }
}
