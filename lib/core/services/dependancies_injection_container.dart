import 'package:cryplet/core/services/dio_wrapper/dio_init.dart';
import 'package:cryplet/shared/data/auth/api/local_auth_api.dart';
import 'package:cryplet/shared/data/auth/api/remote_auth_api.dart';
import 'package:cryplet/shared/data/auth/repositories/auth_repository.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class DependanciesInjectionContainer {
  static Future<void> init() async {
    sl
      ..registerFactory(() => AuthCubit(sl()))
      ..registerFactory(() => AuthRepository(sl(), sl()))
      ..registerLazySingleton(() => RemoteAuthApi(sl()))
      ..registerLazySingleton(() => LocalAuthApi());

    sl.registerLazySingleton<AppApiWrapper>(() => DioInit.getAppApiWrapper());
  }
}
