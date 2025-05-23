import 'package:intl/intl.dart';

/// Date utility functions for the application
class AppDateUtils {
  AppDateUtils._();

  /// Format a date to a string using the specified format
  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(date);
  }

  /// Format a date to a string with time using the specified format
  static String formatDateTime(
    DateTime date, {
    String format = 'yyyy-MM-dd HH:mm',
  }) {
    return DateFormat(format).format(date);
  }

  /// Format a date to a relative time string (e.g. "2 hours ago")
  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  /// Parse a string to a date using the specified format
  static DateTime? parseDate(String date, {String format = 'yyyy-MM-dd'}) {
    try {
      return DateFormat(format).parse(date);
    } catch (e) {
      return null;
    }
  }

  /// Parse a string to a date with time using the specified format
  static DateTime? parseDateTime(
    String date, {
    String format = 'yyyy-MM-dd HH:mm',
  }) {
    try {
      return DateFormat(format).parse(date);
    } catch (e) {
      return null;
    }
  }

  /// Get the start of the day for a date
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Get the end of the day for a date
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  /// Get the start of the month for a date
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  /// Get the end of the month for a date
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0, 23, 59, 59, 999);
  }

  /// Get the start of the year for a date
  static DateTime startOfYear(DateTime date) {
    return DateTime(date.year, 1, 1);
  }

  /// Get the end of the year for a date
  static DateTime endOfYear(DateTime date) {
    return DateTime(date.year, 12, 31, 23, 59, 59, 999);
  }

  /// Get the number of days in a month
  static int daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// Check if a year is a leap year
  static bool isLeapYear(int year) {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  /// Get a list of dates between two dates
  static List<DateTime> datesBetween(DateTime start, DateTime end) {
    final days = end.difference(start).inDays;
    return List.generate(
      days + 1,
      (i) => DateTime(start.year, start.month, start.day + i),
    );
  }

  /// Format a duration to a string (e.g. "2h 30m")
  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${twoDigits(minutes)}m';
    } else if (minutes > 0) {
      return '${minutes}m ${twoDigits(seconds)}s';
    } else {
      return '${seconds}s';
    }
  }
}
