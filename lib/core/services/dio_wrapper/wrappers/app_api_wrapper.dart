part of '../dio_init.dart';

class AppApiWrapper {
  AppApiWrapper();

  Dio getAppDio() {
    final dio = Dio();
    dio.options.baseUrl = '${AppConfig.appBaseUrl}/api';
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          bool result = await InternetConnection().hasInternetAccess;
          if (!result) {
            return handler.reject(
              DioException(
                requestOptions: options,
                response: Response(
                  requestOptions: options,
                  statusCode: 503,
                  data: {'message': 'No internet connection!'},
                ),
              ),
            );
          }
          String? token = AppStorageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
      PrettyDioLogger(),
    ]);

    return dio;
  }
}
