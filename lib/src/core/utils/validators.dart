/// Validation utilities for form fields
class Validators {
  Validators._();

  /// Validates if a string is a valid email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  /// Validates if a string is a valid email (alias for validateEmail)
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates if a string is not empty
  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }

    return null;
  }

  /// Validates if a string is a valid password
  static String? validatePassword(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    return null;
  }

  /// Validates if a string matches another string
  static String? validateMatch(
    String? value,
    String? matchValue, {
    String? fieldName,
  }) {
    if (value != matchValue) {
      return '${fieldName ?? 'Fields'} do not match';
    }

    return null;
  }

  /// Validates if a string is a valid phone number
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Validates if a string is a valid phone number (alias for validatePhone)
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  /// Validates if a string is a valid URL
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'URL is required';
    }

    final urlRegExp = RegExp(
      r'^(http|https)://'
      r'([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}'
      r'(/[\w\-.,@?^=%&:/~+#]*)*$',
    );

    if (!urlRegExp.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  /// Validates if a number is within a range
  static String? validateRange(
    num? value, {
    num? min,
    num? max,
    String? fieldName,
  }) {
    if (value == null) {
      return '${fieldName ?? 'This field'} is required';
    }

    if (min != null && value < min) {
      return '${fieldName ?? 'Value'} must be at least $min';
    }

    if (max != null && value > max) {
      return '${fieldName ?? 'Value'} must be at most $max';
    }

    return null;
  }

  /// Validates if a string has a minimum length
  static String? validateMinLength(
    String? value,
    int minLength, {
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }

    if (value.length < minLength) {
      return '${fieldName ?? 'This field'} must be at least $minLength characters';
    }

    return null;
  }

  /// Validates if a string has a maximum length
  static String? validateMaxLength(
    String? value,
    int maxLength, {
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }

    if (value.length > maxLength) {
      return '${fieldName ?? 'This field'} must be at most $maxLength characters';
    }

    return null;
  }

  /// Validates if a string matches a pattern
  static String? validatePattern(
    String? value,
    RegExp pattern, {
    String? errorMessage,
    String? fieldName,
  }) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }

    if (!pattern.hasMatch(value)) {
      return errorMessage ?? '${fieldName ?? 'This field'} is invalid';
    }

    return null;
  }
}
