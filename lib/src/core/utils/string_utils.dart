/// String utility functions for the application
class StringUtils {
  StringUtils._();

  /// Capitalize the first letter of a string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitalize the first letter of each word in a string
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;

    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1);
        })
        .join(' ');
  }

  /// Convert a string to camel case
  static String toCamelCase(String text) {
    if (text.isEmpty) return text;

    final words =
        text
            .replaceAll(RegExp(r'[^\w\s]'), '')
            .split(RegExp(r'\s+|_|-'))
            .where((word) => word.isNotEmpty)
            .toList();

    final firstWord = words.first.toLowerCase();
    final remainingWords = words.skip(1).map(capitalize).toList();

    return firstWord + remainingWords.join('');
  }

  /// Convert a string to snake case
  static String toSnakeCase(String text) {
    if (text.isEmpty) return text;

    final result = text
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)}')
        .toLowerCase()
        .replaceAll(RegExp(r'\s+|-'), '_')
        .replaceAll(RegExp(r'_{2,}'), '_');

    return result.startsWith('_') ? result.substring(1) : result;
  }

  /// Convert a string to kebab case
  static String toKebabCase(String text) {
    if (text.isEmpty) return text;

    final result = text
        .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '-${match.group(0)}')
        .toLowerCase()
        .replaceAll(RegExp(r'\s+|_'), '-')
        .replaceAll(RegExp(r'-{2,}'), '-');

    return result.startsWith('-') ? result.substring(1) : result;
  }

  /// Truncate a string to a maximum length and add an ellipsis if needed
  static String truncate(
    String text,
    int maxLength, {
    String ellipsis = '...',
  }) {
    if (text.length <= maxLength) return text;

    return text.substring(0, maxLength) + ellipsis;
  }

  /// Remove all whitespace from a string
  static String removeWhitespace(String text) {
    return text.replaceAll(RegExp(r'\s+'), '');
  }

  /// Check if a string is a valid email
  static bool isEmail(String text) {
    return RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(text);
  }

  /// Check if a string is a valid URL
  static bool isUrl(String text) {
    return RegExp(
      r'^(http|https)://'
      r'([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}'
      r'(/[\w\-.,@?^=%&:/~+#]*)*$',
    ).hasMatch(text);
  }

  /// Extract hashtags from a string
  static List<String> extractHashtags(String text) {
    final matches = RegExp(r'#(\w+)').allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Extract mentions from a string
  static List<String> extractMentions(String text) {
    final matches = RegExp(r'@(\w+)').allMatches(text);
    return matches.map((match) => match.group(0)!).toList();
  }

  /// Generate a random string of a specified length
  static String randomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = StringBuffer();

    for (var i = 0; i < length; i++) {
      random.write(chars[DateTime.now().microsecondsSinceEpoch % chars.length]);
    }

    return random.toString();
  }

  /// Format a phone number for display
  static String formatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    final digits = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digits.length == 10) {
      // Format as (XXX) XXX-XXXX for US numbers
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    } else if (digits.length > 10) {
      // Format as +X XXX XXX XXXX for international numbers
      return '+${digits.substring(0, digits.length - 10)} ${digits.substring(digits.length - 10, digits.length - 7)} ${digits.substring(digits.length - 7, digits.length - 4)} ${digits.substring(digits.length - 4)}';
    }

    // Return as is if not a standard format
    return phoneNumber;
  }
}
