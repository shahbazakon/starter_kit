import 'package:flutter_test/flutter_test.dart';
import 'package:starter_kit/src/core/utils/string_utils.dart';
import 'package:starter_kit/src/core/utils/date_utils.dart';
import 'package:starter_kit/src/core/utils/validators.dart';
import 'package:starter_kit/src/data/models/api_response.dart';

void main() {
  group('StarterKit Tests', () {
    group('StringUtils', () {
      test('should capitalize string correctly', () {
        expect(StringUtils.capitalize('hello'), 'Hello');
        expect(StringUtils.capitalize('HELLO'), 'Hello');
        expect(StringUtils.capitalize(''), '');
      });

      test('should check if string is email correctly', () {
        expect(StringUtils.isEmail('test@example.com'), true);
        expect(StringUtils.isEmail('invalid-email'), false);
        expect(StringUtils.isEmail(''), false);
      });

      test('should truncate string correctly', () {
        expect(StringUtils.truncate('Hello World', 5), 'Hello...');
        expect(StringUtils.truncate('Hello', 10), 'Hello');
      });
    });

    group('DateUtils', () {
      test('should format date correctly', () {
        final date = DateTime(2023, 12, 25);
        expect(AppDateUtils.formatDate(date), '2023-12-25');
      });

      test('should check if date is today', () {
        final today = DateTime.now();
        final yesterday = DateTime.now().subtract(const Duration(days: 1));

        expect(AppDateUtils.isToday(today), true);
        expect(AppDateUtils.isToday(yesterday), false);
      });
    });

    group('Validators', () {
      test('should validate email correctly', () {
        expect(Validators.email('test@example.com'), isNull);
        expect(
          Validators.email('invalid'),
          'Please enter a valid email address',
        );
        expect(Validators.email(''), 'Email is required');
      });

      test('should validate phone correctly', () {
        expect(Validators.phone('+1234567890'), isNull);
        expect(Validators.phone('123'), 'Please enter a valid phone number');
        expect(Validators.phone(''), 'Phone number is required');
      });
    });

    group('ApiResponse', () {
      test('should create success response correctly', () {
        final response = ApiResponse<String>.success(
          data: 'test',
          message: 'Success',
        );

        expect(response.success, true);
        expect(response.data, 'test');
        expect(response.message, 'Success');
        expect(response.isSuccess, true);
      });

      test('should create error response correctly', () {
        final response = ApiResponse<String>.error(
          message: 'Error occurred',
          code: 400,
          errors: ['Validation failed'],
        );

        expect(response.success, false);
        expect(response.message, 'Error occurred');
        expect(response.code, 400);
        expect(response.errors, ['Validation failed']);
        expect(response.isSuccess, false);
      });
    });
  });
}
