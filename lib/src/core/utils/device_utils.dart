import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Device utility functions for the application
class DeviceUtils {
  DeviceUtils._();

  /// Device info plugin
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  /// Get the device ID
  static Future<String> getDeviceId() async {
    if (kIsWeb) {
      final webInfo = await _deviceInfoPlugin.webBrowserInfo;
      return webInfo.userAgent ?? 'web-unknown';
    } else if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor ?? 'ios-unknown';
    } else if (Platform.isLinux) {
      final linuxInfo = await _deviceInfoPlugin.linuxInfo;
      return linuxInfo.machineId ?? 'linux-unknown';
    } else if (Platform.isMacOS) {
      final macOsInfo = await _deviceInfoPlugin.macOsInfo;
      return macOsInfo.systemGUID ?? 'macos-unknown';
    } else if (Platform.isWindows) {
      final windowsInfo = await _deviceInfoPlugin.windowsInfo;
      return windowsInfo.deviceId;
    } else {
      return 'unknown';
    }
  }

  /// Get the device name
  static Future<String> getDeviceName() async {
    if (kIsWeb) {
      final webInfo = await _deviceInfoPlugin.webBrowserInfo;
      return webInfo.browserName.name;
    } else if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return iosInfo.name;
    } else if (Platform.isLinux) {
      final linuxInfo = await _deviceInfoPlugin.linuxInfo;
      return linuxInfo.name;
    } else if (Platform.isMacOS) {
      final macOsInfo = await _deviceInfoPlugin.macOsInfo;
      return macOsInfo.computerName;
    } else if (Platform.isWindows) {
      final windowsInfo = await _deviceInfoPlugin.windowsInfo;
      return windowsInfo.computerName;
    } else {
      return 'unknown';
    }
  }

  /// Get the operating system name and version
  static Future<String> getOsVersion() async {
    if (kIsWeb) {
      final webInfo = await _deviceInfoPlugin.webBrowserInfo;
      return '${webInfo.platform} ${webInfo.appVersion}';
    } else if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return 'Android ${androidInfo.version.release}';
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return '${iosInfo.systemName} ${iosInfo.systemVersion}';
    } else if (Platform.isLinux) {
      final linuxInfo = await _deviceInfoPlugin.linuxInfo;
      return 'Linux ${linuxInfo.version}';
    } else if (Platform.isMacOS) {
      final macOsInfo = await _deviceInfoPlugin.macOsInfo;
      return 'macOS ${macOsInfo.osRelease}';
    } else if (Platform.isWindows) {
      final windowsInfo = await _deviceInfoPlugin.windowsInfo;
      return 'Windows ${windowsInfo.displayVersion}';
    } else {
      return 'unknown';
    }
  }

  /// Get the application version
  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// Get the application build number
  static Future<String> getAppBuildNumber() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  /// Get the application name
  static Future<String> getAppName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  /// Get the application package name
  static Future<String> getPackageName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  /// Check if the device is a mobile device
  static bool isMobile() {
    return !kIsWeb && (Platform.isAndroid || Platform.isIOS);
  }

  /// Check if the device is a desktop device
  static bool isDesktop() {
    return !kIsWeb &&
        (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
  }

  /// Check if the app is running on the web
  static bool isWeb() {
    return kIsWeb;
  }

  /// Get the device type (mobile, tablet, desktop, web)
  static Future<String> getDeviceType() async {
    if (kIsWeb) {
      return 'web';
    } else if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      // Simple heuristic for Android: diagonal screen size > 7 inches is a tablet
      final diagonalInches = _calculateDiagonalInches(
        androidInfo.displayMetrics.widthPx / androidInfo.displayMetrics.density,
        androidInfo.displayMetrics.heightPx /
            androidInfo.displayMetrics.density,
      );
      return diagonalInches > 7 ? 'tablet' : 'mobile';
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      // For iOS, check the model identifier
      return iosInfo.model.toLowerCase().contains('ipad') ? 'tablet' : 'mobile';
    } else {
      return 'desktop';
    }
  }

  /// Calculate the diagonal screen size in inches
  static double _calculateDiagonalInches(double widthDp, double heightDp) {
    final diagonalDp = sqrt(widthDp * widthDp + heightDp * heightDp);
    return diagonalDp / 160; // 160 is the default density
  }

  /// Get the device memory in GB
  static Future<double> getDeviceMemory() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      // Convert from bytes to GB
      return androidInfo.totalMemory / (1024 * 1024 * 1024);
    } else {
      // Not available for other platforms
      return 0;
    }
  }
}

/// Calculate the square root of a number
double sqrt(double value) {
  return value * 0.5 + value / (2 * value * 0.5);
}
