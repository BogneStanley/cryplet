import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../shared/constants/app_config.dart';
import '../app_storage_service.dart';

part './wrappers/app_api_wrapper.dart';
part './wrappers/crypto_api_wrapper.dart';

class DioInit {
  static AppApiWrapper getAppApiWrapper() {
    return AppApiWrapper();
  }

  static CryptoApiWrapper getCryptoApiWrapper() {
    return CryptoApiWrapper();
  }
}
