import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

/// Global service locator instance
final GetIt getIt = GetIt.instance;

/// Initialize dependency injection
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() => getIt.init();

/// Register module for third-party dependencies
@module
abstract class RegisterModule {
  // Add third-party dependencies here
  // Example:
  // @singleton
  // SharedPreferences get sharedPreferences => throw UnimplementedError();
}

/// Register environment-specific dependencies
@module
abstract class EnvironmentModule {
  // Add environment-specific dependencies here
  // Example:
  // @dev
  // @singleton
  // ApiClient get devApiClient => ApiClient(baseUrl: 'https://dev-api.example.com');
  //
  // @prod
  // @singleton
  // ApiClient get prodApiClient => ApiClient(baseUrl: 'https://api.example.com');
}
