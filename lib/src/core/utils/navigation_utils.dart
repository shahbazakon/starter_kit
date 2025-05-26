import 'package:flutter/material.dart';

/// Navigation utilities for common navigation tasks
class NavigationUtils {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  /// Get current context
  static BuildContext? get currentContext => navigatorKey.currentContext;
  
  /// Get current navigator state
  static NavigatorState? get navigator => navigatorKey.currentState;
  
  /// Push new route
  static Future<T?> push<T extends Object?>(Widget page) {
    return navigator?.push<T>(
      MaterialPageRoute(builder: (_) => page),
    ) ?? Future.value(null);
  }
  
  /// Push named route
  static Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    return navigator?.pushNamed<T>(routeName, arguments: arguments) ?? Future.value(null);
  }
  
  /// Replace current route
  static Future<T?> pushReplacement<T extends Object?, TO extends Object?>(Widget page, {TO? result}) {
    return navigator?.pushReplacement<T, TO>(
      MaterialPageRoute(builder: (_) => page),
      result: result,
    ) ?? Future.value(null);
  }
  
  /// Push and clear stack
  static Future<T?> pushAndClearStack<T extends Object?>(Widget page) {
    return navigator?.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    ) ?? Future.value(null);
  }
  
  /// Pop current route
  static void pop<T extends Object?>([T? result]) {
    if (navigator?.canPop() == true) {
      navigator?.pop<T>(result);
    }
  }
  
  /// Pop until route
  static void popUntil(String routeName) {
    navigator?.popUntil(ModalRoute.withName(routeName));
  }
  
  /// Show snack bar
  static void showSnackBar({
    required String message,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    final context = currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          action: action,
          duration: duration,
        ),
      );
    }
  }
  
  /// Show dialog
  static Future<T?> showAlertDialog<T>({
    required String title,
    required String content,
    String confirmText = 'OK',
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    final context = currentContext;
    if (context == null) return Future.value(null);
    
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }
  
  /// Show loading dialog
  static void showLoadingDialog({String message = 'Loading...'}) {
    final context = currentContext;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 16),
              Text(message),
            ],
          ),
        ),
      );
    }
  }
  
  /// Hide loading dialog
  static void hideLoadingDialog() {
    final context = currentContext;
    if (context != null && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
