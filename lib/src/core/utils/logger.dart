import 'package:flutter/foundation.dart';

/// Logging utilities for development and debugging
class AppLogger {
  static const String _prefix = '[StarterKit]';
  
  /// Log debug message
  static void d(String message, [String? tag]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '$_prefix [$tag] $message' : '$_prefix $message';
      debugPrint(logMessage);
    }
  }
  
  /// Log info message  
  static void i(String message, [String? tag]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '$_prefix [INFO] [$tag] $message' : '$_prefix [INFO] $message';
      debugPrint(logMessage);
    }
  }
  
  /// Log warning message
  static void w(String message, [String? tag]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '$_prefix [WARNING] [$tag] $message' : '$_prefix [WARNING] $message';
      debugPrint(logMessage);
    }
  }
  
  /// Log error message
  static void e(String message, [String? tag, Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      final logMessage = tag != null ? '$_prefix [ERROR] [$tag] $message' : '$_prefix [ERROR] $message';
      debugPrint(logMessage);
      
      if (error != null) {
        debugPrint('$_prefix [ERROR] Exception: $error');
      }
      
      if (stackTrace != null) {
        debugPrint('$_prefix [ERROR] Stack trace: $stackTrace');
      }
    }
  }
  
  /// Log network request
  static void network(String method, String url, {Map<String, dynamic>? data}) {
    if (kDebugMode) {
      debugPrint('$_prefix [NETWORK] $method $url');
      if (data != null) {
        debugPrint('$_prefix [NETWORK] Data: $data');
      }
    }
  }
  
  /// Log performance timing
  static void performance(String operation, Duration duration) {
    if (kDebugMode) {
      debugPrint('$_prefix [PERFORMANCE] $operation took ${duration.inMilliseconds}ms');
    }
  }
  
  /// Trace method execution
  static void trace(String methodName, [String? className]) {
    if (kDebugMode) {
      final message = className != null ? '$className.$methodName' : methodName;
      debugPrint('$_prefix [TRACE] $message');
    }
  }
}
