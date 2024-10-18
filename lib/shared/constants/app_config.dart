import 'package:dotenv/dotenv.dart';

abstract class AppConfig {
  static final _env = DotEnv()..load();
  static String get cryptoApiKey => _env.getOrElse('CRYPTO_API_KEY', () => '');
  static String get appName => _env.getOrElse('APP_NAME', () => 'Cryplet');
  static String get appBaseUrl => _env.getOrElse('APP_BASE_URL', () => '');
}
