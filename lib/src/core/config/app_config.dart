/// Application configuration
class AppConfig {
  static const String appName = 'MyApp';
  static const String appVersion = '1.0.0';
  static const String apiBaseUrl = 'https://api.example.com';
  static const bool isDebug = true;
  static const int apiTimeout = 30000;

  // Environment configurations
  static String get environment => isDebug ? 'development' : 'production';

  // API configurations
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
