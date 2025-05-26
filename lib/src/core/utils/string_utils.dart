/// String manipulation utilities
class StringUtils {
  /// Capitalize first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  
  /// Convert to camelCase
  static String toCamelCase(String text) {
    final words = text.split(RegExp(r'[\s_-]+'));
    if (words.isEmpty) return '';
    
    final first = words.first.toLowerCase();
    final rest = words.skip(1).map((word) => capitalize(word));
    return first + rest.join();
  }
  
  /// Convert to snake_case
  static String toSnakeCase(String text) {
    return text
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)}')
        .toLowerCase()
        .replaceAll(RegExp(r'^_'), '');
  }
  
  /// Truncate text with ellipsis
  static String truncate(String text, int maxLength, {String suffix = '...'}) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength - suffix.length) + suffix;
  }
  
  /// Check if string is valid email
  static bool isEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  /// Check if string is valid phone number
  static bool isPhoneNumber(String phone) {
    return RegExp(r'^[\+]?[1-9]?[0-9]{7,15}$').hasMatch(phone);
  }
  
  /// Check if string is valid URL
  static bool isUrl(String url) {
    return RegExp(r'^https?:\/\/.+').hasMatch(url);
  }
  
  /// Remove HTML tags
  static String removeHtmlTags(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '');
  }
  
  /// Generate random string
  static String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(length, (index) => chars[(DateTime.now().millisecondsSinceEpoch + index) % chars.length]).join();
  }
}
