abstract class AppConfig {
  static String get cryptoApiKey =>
      const String.fromEnvironment('CRYPTO_API_KEY');
  static String get appName => const String.fromEnvironment('APP_NAME');
  static String get appBaseUrl => const String.fromEnvironment('APP_BASE_URL');
  static String get cryptoBaseUrl =>
      const String.fromEnvironment('CRYPTO_API_URL');
}
