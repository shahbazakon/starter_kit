import 'package:get_it/get_it.dart';
import '../config/app_config.dart';
import '../network/api_client.dart';

/// Dependency injection container
final GetIt getIt = GetIt.instance;

/// Shorthand for getting dependencies
T get<T extends Object>() => getIt<T>();

/// Configure dependencies for different environments
Future<void> configureDependencies({String environment = 'production'}) async {
  // Register core services
  getIt.registerLazySingleton<AppConfig>(() => AppConfig());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient());
  
  // Environment-specific configurations
  switch (environment) {
    case 'development':
    case 'dev':
      await _configureDevelopmentDependencies();
      break;
    case 'staging':
      await _configureStagingDependencies();
      break;
    case 'production':
    default:
      await _configureProductionDependencies();
      break;
  }
}

Future<void> _configureDevelopmentDependencies() async {
  // Development-specific services
  // Example: Mock services, debug tools
}

Future<void> _configureStagingDependencies() async {
  // Staging-specific services
  // Example: Analytics, crash reporting
}

Future<void> _configureProductionDependencies() async {
  // Production-specific services
  // Example: Analytics, crash reporting, performance monitoring
}

/// Reset dependencies (useful for testing)
void resetDependencies() {
  getIt.reset();
}
