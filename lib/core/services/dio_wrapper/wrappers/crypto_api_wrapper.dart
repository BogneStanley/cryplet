part of '../dio_init.dart';

class CryptoApiWrapper {
  Dio getAppDio() {
    final dio = Dio();
    dio.options.baseUrl = '${AppConfig.appBaseUrl}/api';
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          bool result = await InternetConnection().hasInternetAccess;
          if (!result) {
            throw DioException(
              requestOptions: options,
              response: Response(
                requestOptions: options,
                statusCode: 503,
                data: {'message': 'No internet connection!'},
              ),
            );
          }
          String? token = AppConfig.cryptoApiKey;
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}
