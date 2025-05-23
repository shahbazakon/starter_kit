import 'package:flutter/material.dart';

/// Navigation utility functions for the application
class NavigationUtils {
  NavigationUtils._();

  /// Global navigation key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// Get the current context
  static BuildContext? get currentContext => navigatorKey.currentContext;

  /// Push a new route onto the navigation stack
  static Future<T?> push<T>(
    Widget page, {
    bool fullscreenDialog = false,
  }) async {
    return await navigatorKey.currentState?.push<T>(
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Push a named route onto the navigation stack
  static Future<T?> pushNamed<T>(String routeName, {Object? arguments}) async {
    return await navigatorKey.currentState?.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  /// Replace the current route with a new one
  static Future<T?> pushReplacement<T, TO>(
    Widget page, {
    bool fullscreenDialog = false,
  }) async {
    return await navigatorKey.currentState?.pushReplacement<T, TO>(
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  /// Replace the current named route with a new one
  static Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState?.pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
    );
  }

  /// Push a new route and remove all previous routes
  static Future<T?> pushAndRemoveUntil<T>(
    Widget page, {
    bool fullscreenDialog = false,
  }) async {
    return await navigatorKey.currentState?.pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (context) => page,
        fullscreenDialog: fullscreenDialog,
      ),
      (route) => false,
    );
  }

  /// Push a named route and remove all previous routes
  static Future<T?> pushNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// Pop the current route
  static void pop<T>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
  }

  /// Pop until a specific route
  static void popUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  /// Check if we can pop the current route
  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  /// Pop the current route if possible
  static void maybePop<T>([T? result]) {
    navigatorKey.currentState?.maybePop<T>(result);
  }

  /// Show a dialog
  static Future<T?> showAppDialog<T>({
    required Widget dialog,
    bool barrierDismissible = true,
  }) async {
    return await showDialog<T>(
      context: navigatorKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) => dialog,
    );
  }

  /// Show a modal bottom sheet
  static Future<T?> showAppBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = false,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isDismissible = true,
    bool enableDrag = true,
  }) async {
    return await showModalBottomSheet<T>(
      context: navigatorKey.currentContext!,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) => child,
    );
  }

  /// Show a snackbar
  static void showSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color? backgroundColor,
    Color? textColor,
    SnackBarAction? action,
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(
      navigatorKey.currentContext!,
    );
    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: textColor)),
        duration: duration,
        backgroundColor: backgroundColor,
        action: action,
      ),
    );
  }

  /// Show a loading dialog
  static void showLoadingDialog({String? message}) {
    showAppDialog(
      dialog: PopScope(
        canPop: false,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                if (message != null) ...[
                  const SizedBox(height: 16.0),
                  Text(message),
                ],
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Hide the loading dialog
  static void hideLoadingDialog() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    }
  }
}
