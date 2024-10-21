import 'package:cryplet/core/services/dio_wrapper/dio_init.dart';
import 'package:cryplet/features/wallet/screens/state/get_currencies_list_cubit/get_currencies_list_cubit.dart';
import 'package:cryplet/shared/data/auth/api/local_auth_api.dart';
import 'package:cryplet/shared/data/auth/api/remote_auth_api.dart';
import 'package:cryplet/shared/data/auth/repositories/auth_repository.dart';
import 'package:cryplet/shared/data/crypto/api/crypto_local_api.dart';
import 'package:cryplet/shared/data/crypto/api/crypto_remote_api.dart';
import 'package:cryplet/shared/data/crypto/repositories/crypto_repository.dart';
import 'package:cryplet/shared/states/auth/auth_cubit.dart';
import 'package:cryplet/shared/states/wallet/wallet_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class DependanciesInjectionContainer {
  static Future<void> init() async {
    sl
      ..registerFactory(() => AuthCubit(sl()))
      ..registerFactory(() => AuthRepository(sl(), sl()))
      ..registerLazySingleton(() => RemoteAuthApi(sl()))
      ..registerLazySingleton(() => LocalAuthApi());

    sl
      ..registerFactory(() => WalletCubit(sl()))
      ..registerLazySingleton(() => CryptoRepository(sl(), sl()))
      ..registerLazySingleton(() => CryptoRemoteApi(sl()))
      ..registerLazySingleton(() => CryptoLocalApi());

    sl.registerFactory(() => GetCurrenciesListCubit(sl()));

    sl
      ..registerLazySingleton<AppApiWrapper>(() => DioInit.getAppApiWrapper())
      ..registerLazySingleton<CryptoApiWrapper>(
          () => DioInit.getCryptoApiWrapper());
  }
}
