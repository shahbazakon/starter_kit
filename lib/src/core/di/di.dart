import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../config/app_config.dart';
import '../network/api_client.dart';

/// Global service locator instance
final GetIt getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> configureDependencies({String environment = 'dev'}) async {
  // Clear existing registrations
  await getIt.reset();

  // Register Logger
  getIt.registerLazySingleton<Logger>(
    () => Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
    ),
  );

  // Register AppConfig based on environment
  getIt.registerLazySingleton<AppConfig>(() {
    switch (environment.toLowerCase()) {
      case 'prod':
      case 'production':
        return AppConfig.production();
      case 'staging':
        return AppConfig.staging();
      case 'dev':
      case 'development':
      default:
        return AppConfig.development();
    }
  });

  // Register Dio
  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    ),
  );

  // Register ApiClient
  getIt.registerLazySingleton<ApiClient>(
    () => ApiClient.fromConfig(getIt<AppConfig>(), getIt<Logger>()),
  );
}

/// Register development dependencies
void registerDevDependencies() {
  // Add development-specific dependencies here
}

/// Register production dependencies
void registerProdDependencies() {
  // Add production-specific dependencies here
}

/// Get service from dependency injection container
T get<T extends Object>() => getIt<T>();

/// Check if service is registered
bool isRegistered<T extends Object>() => getIt.isRegistered<T>();
