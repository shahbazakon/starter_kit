import 'package:logger/logger.dart';

/// Logger utility for the application
class AppLogger {
  /// Logger instance
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  /// Logger instance for production
  static final Logger _prodLogger = Logger(
    printer: SimplePrinter(printTime: true),
    level: Level.warning,
  );

  /// Is the logger in production mode
  static bool _isProduction = false;

  /// Set the logger to production mode
  static void setProduction(bool isProduction) {
    _isProduction = isProduction;
  }

  /// Get the appropriate logger based on the environment
  static Logger get logger => _isProduction ? _prodLogger : _logger;

  /// Log a debug message
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  /// Log an info message
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  /// Log a warning message
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  /// Log an error message
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log a verbose message
  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.v(message, error: error, stackTrace: stackTrace);
  }

  /// Log a wtf message
  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    logger.f(message, error: error, stackTrace: stackTrace);
  }
}
