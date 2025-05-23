/// Application configuration class for managing environment-specific settings
class AppConfig {
  /// Base URL for the API
  final String apiBaseUrl;

  /// Application name
  final String appName;

  /// Application version
  final String appVersion;

  /// Application build number
  final String buildNumber;

  /// Is the app in debug mode
  final bool isDebug;

  /// Additional configuration parameters
  final Map<String, dynamic>? additionalConfig;

  /// Creates an instance of AppConfig
  const AppConfig({
    required this.apiBaseUrl,
    required this.appName,
    required this.appVersion,
    required this.buildNumber,
    required this.isDebug,
    this.additionalConfig,
  });

  /// Creates a development environment configuration
  factory AppConfig.development() {
    return const AppConfig(
      apiBaseUrl: 'https://api-dev.example.com/v1/',
      appName: 'MyApp Dev',
      appVersion: '1.0.0',
      buildNumber: '1',
      isDebug: true,
    );
  }

  /// Creates a staging environment configuration
  factory AppConfig.staging() {
    return const AppConfig(
      apiBaseUrl: 'https://api-staging.example.com/v1/',
      appName: 'MyApp Staging',
      appVersion: '1.0.0',
      buildNumber: '1',
      isDebug: true,
    );
  }

  /// Creates a production environment configuration
  factory AppConfig.production() {
    return const AppConfig(
      apiBaseUrl: 'https://api.example.com/v1/',
      appName: 'MyApp',
      appVersion: '1.0.0',
      buildNumber: '1',
      isDebug: false,
    );
  }

  /// Creates a custom environment configuration
  factory AppConfig.custom({
    required String apiBaseUrl,
    required String appName,
    required String appVersion,
    required String buildNumber,
    bool isDebug = false,
    Map<String, dynamic>? additionalConfig,
  }) {
    return AppConfig(
      apiBaseUrl: apiBaseUrl,
      appName: appName,
      appVersion: appVersion,
      buildNumber: buildNumber,
      isDebug: isDebug,
      additionalConfig: additionalConfig,
    );
  }
}
