import 'package:flutter/material.dart';

/// Color palette for the application, inspired by WeChat design system
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF07C160);
  static const Color primaryDark = Color(0xFF06AD56);
  static const Color primaryLight = Color(0xFF7EDEA7);

  // Secondary Colors
  static const Color secondary = Color(0xFF1989FA);
  static const Color secondaryDark = Color(0xFF0570E5);
  static const Color secondaryLight = Color(0xFF73B8FF);

  // Accent Colors
  static const Color accent = Color(0xFFFF9C19);
  static const Color accentDark = Color(0xFFE68A17);
  static const Color accentLight = Color(0xFFFFBF73);

  // Semantic Colors
  static const Color success = Color(0xFF07C160);
  static const Color warning = Color(0xFFFF976A);
  static const Color error = Color(0xFFEE0A24);
  static const Color info = Color(0xFF1989FA);

  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF323233);
  static const Color grey = Color(0xFF969799);
  static const Color lightGrey = Color(0xFFEBEDF0);
  static const Color background = Color(0xFFF7F8FA);
  static const Color white = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF323233);
  static const Color textSecondary = Color(0xFF646566);
  static const Color textTertiary = Color(0xFF969799);
  static const Color textDisabled = Color(0xFFC8C9CC);

  // Border Colors
  static const Color border = Color(0xFFEBEDF0);
  static const Color divider = Color(0xFFEBEDF0);

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color modalBackground = Color(0xFFF7F8FA);

  // Social Colors
  static const Color wechatGreen = Color(0xFF07C160);
  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color twitterBlue = Color(0xFF1DA1F2);

  /// Get color scheme for light theme
  static ColorScheme get lightColorScheme => const ColorScheme(
    primary: primary,
    primaryContainer: primaryLight,
    secondary: secondary,
    secondaryContainer: secondaryLight,
    surface: white,
    background: background,
    error: error,
    onPrimary: white,
    onSecondary: white,
    onSurface: textPrimary,
    onBackground: textPrimary,
    onError: white,
    brightness: Brightness.light,
  );

  /// Get color scheme for dark theme
  static ColorScheme get darkColorScheme => const ColorScheme(
    primary: primary,
    primaryContainer: primaryDark,
    secondary: secondary,
    secondaryContainer: secondaryDark,
    surface: Color(0xFF121212),
    background: Color(0xFF121212),
    error: error,
    onPrimary: white,
    onSecondary: white,
    onSurface: white,
    onBackground: white,
    onError: white,
    brightness: Brightness.dark,
  );
}
