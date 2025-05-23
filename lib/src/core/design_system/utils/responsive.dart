import 'package:flutter/material.dart';

/// Responsive utilities for adapting UI to different screen sizes
class AppResponsive {
  AppResponsive._();

  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  static const double largeDesktopBreakpoint = 1440;

  /// Check if the screen is mobile size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Check if the screen is tablet size
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if the screen is desktop size
  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= tabletBreakpoint && width < desktopBreakpoint;
  }

  /// Check if the screen is large desktop size
  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  /// Get the current device type
  static DeviceType getDeviceType(BuildContext context) {
    if (isMobile(context)) {
      return DeviceType.mobile;
    } else if (isTablet(context)) {
      return DeviceType.tablet;
    } else if (isDesktop(context)) {
      return DeviceType.desktop;
    } else {
      return DeviceType.largeDesktop;
    }
  }

  /// Get a value based on the current screen size
  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceType.largeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
    }
  }

  /// Get a widget based on the current screen size
  static Widget builder({
    required BuildContext context,
    required Widget Function(BuildContext context, DeviceType deviceType)
    builder,
  }) {
    final deviceType = getDeviceType(context);
    return builder(context, deviceType);
  }

  /// Get the padding based on the current screen size
  static EdgeInsets getPadding(BuildContext context) {
    return value<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.all(16),
      tablet: const EdgeInsets.all(24),
      desktop: const EdgeInsets.all(32),
      largeDesktop: const EdgeInsets.all(48),
    );
  }

  /// Get the horizontal padding based on the current screen size
  static EdgeInsets getHorizontalPadding(BuildContext context) {
    return value<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.symmetric(horizontal: 16),
      tablet: const EdgeInsets.symmetric(horizontal: 24),
      desktop: const EdgeInsets.symmetric(horizontal: 32),
      largeDesktop: const EdgeInsets.symmetric(horizontal: 48),
    );
  }

  /// Get the vertical padding based on the current screen size
  static EdgeInsets getVerticalPadding(BuildContext context) {
    return value<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.symmetric(vertical: 16),
      tablet: const EdgeInsets.symmetric(vertical: 24),
      desktop: const EdgeInsets.symmetric(vertical: 32),
      largeDesktop: const EdgeInsets.symmetric(vertical: 48),
    );
  }

  /// Get the maximum content width based on the current screen size
  static double getMaxContentWidth(BuildContext context) {
    return value<double>(
      context: context,
      mobile: double.infinity,
      tablet: 768,
      desktop: 1024,
      largeDesktop: 1200,
    );
  }
}

/// Device type enum for responsive design
enum DeviceType { mobile, tablet, desktop, largeDesktop }

/// Extension on BuildContext for responsive utilities
extension ResponsiveContext on BuildContext {
  /// Check if the screen is mobile size
  bool get isMobile => AppResponsive.isMobile(this);

  /// Check if the screen is tablet size
  bool get isTablet => AppResponsive.isTablet(this);

  /// Check if the screen is desktop size
  bool get isDesktop => AppResponsive.isDesktop(this);

  /// Check if the screen is large desktop size
  bool get isLargeDesktop => AppResponsive.isLargeDesktop(this);

  /// Get the current device type
  DeviceType get deviceType => AppResponsive.getDeviceType(this);

  /// Get the responsive padding
  EdgeInsets get responsivePadding => AppResponsive.getPadding(this);

  /// Get the responsive horizontal padding
  EdgeInsets get responsiveHorizontalPadding =>
      AppResponsive.getHorizontalPadding(this);

  /// Get the responsive vertical padding
  EdgeInsets get responsiveVerticalPadding =>
      AppResponsive.getVerticalPadding(this);

  /// Get the maximum content width
  double get maxContentWidth => AppResponsive.getMaxContentWidth(this);

  /// Get a value based on the current screen size
  T responsive<T>({required T mobile, T? tablet, T? desktop, T? largeDesktop}) {
    return AppResponsive.value(
      context: this,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
      largeDesktop: largeDesktop,
    );
  }
}
