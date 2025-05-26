import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Device information and platform utilities
class DeviceUtils {
  /// Get device unique identifier
  static Future<String> getDeviceId() async {
    if (kIsWeb) {
      return 'web-device';
    }
    
    try {
      // In a real app, you'd use device_info_plus package
      if (Platform.isIOS) {
        return 'ios-device-${DateTime.now().millisecondsSinceEpoch}';
      } else if (Platform.isAndroid) {
        return 'android-device-${DateTime.now().millisecondsSinceEpoch}';
      } else {
        return 'unknown-device-${DateTime.now().millisecondsSinceEpoch}';
      }
    } catch (e) {
      return 'unknown-device';
    }
  }
  
  /// Get device name
  static Future<String> getDeviceName() async {
    if (kIsWeb) {
      return 'Web Browser';
    }
    
    try {
      if (Platform.isIOS) {
        return 'iPhone';
      } else if (Platform.isAndroid) {
        return 'Android Device';
      } else if (Platform.isMacOS) {
        return 'Mac';
      } else if (Platform.isWindows) {
        return 'Windows PC';
      } else if (Platform.isLinux) {
        return 'Linux PC';
      } else {
        return 'Unknown Device';
      }
    } catch (e) {
      return 'Unknown Device';
    }
  }
  
  /// Get OS version
  static Future<String> getOsVersion() async {
    if (kIsWeb) {
      return 'Web';
    }
    
    try {
      return Platform.operatingSystemVersion;
    } catch (e) {
      return 'Unknown';
    }
  }
  
  /// Get app version
  static Future<String> getAppVersion() async {
    try {
      // In a real app, you'd use package_info_plus
      return '1.0.0';
    } catch (e) {
      return 'Unknown';
    }
  }
  
  /// Get package name
  static Future<String> getPackageName() async {
    try {
      // In a real app, you'd use package_info_plus
      return 'com.example.app';
    } catch (e) {
      return 'Unknown';
    }
  }
  
  /// Get device type
  static Future<String> getDeviceType() async {
    if (kIsWeb) {
      return 'web';
    }
    
    try {
      if (Platform.isIOS || Platform.isAndroid) {
        return 'mobile';
      } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
        return 'desktop';
      } else {
        return 'unknown';
      }
    } catch (e) {
      return 'unknown';
    }
  }
  
  /// Check if device is mobile
  static bool isMobile() {
    if (kIsWeb) return false;
    return Platform.isIOS || Platform.isAndroid;
  }
  
  /// Check if device is desktop
  static bool isDesktop() {
    if (kIsWeb) return false;
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }
  
  /// Check if running on web
  static bool isWeb() {
    return kIsWeb;
  }
  
  /// Check if device is iOS
  static bool isIOS() {
    if (kIsWeb) return false;
    return Platform.isIOS;
  }
  
  /// Check if device is Android
  static bool isAndroid() {
    if (kIsWeb) return false;
    return Platform.isAndroid;
  }
  
  /// Vibrate device (if supported)
  static Future<void> vibrate() async {
    try {
      await HapticFeedback.mediumImpact();
    } catch (e) {
      // Vibration not supported
    }
  }
  
  /// Hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
  
  /// Check if keyboard is visible
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
  
  /// Get screen size
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
  
  /// Check if device is tablet
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal = (size.width * size.width + size.height * size.height);
    return diagonal > 1100000; // Rough tablet detection
  }
}
