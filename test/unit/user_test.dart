import 'package:flutter_test/flutter_test.dart';
import 'package:starter_kit/src/data/models/user.dart';

void main() {
  group('User Tests', () {
    test('should create User from JSON', () {
      final json = {
        'id': '1',
        'name': 'Test User',
        'createdAt': '2024-01-01T00:00:00Z',
        'updatedAt': '2024-01-01T00:00:00Z',
      };

      final model = User.fromJson(json);

      expect(model.id, '1');
      expect(model.name, 'Test User');
      expect(model.createdAt, DateTime.parse('2024-01-01T00:00:00Z'));
      expect(model.updatedAt, DateTime.parse('2024-01-01T00:00:00Z'));
    });

    test('should convert User to JSON', () {
      final model = User(
        id: '1',
        name: 'Test User',
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      final json = model.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'Test User');
      expect(json['createdAt'], '2024-01-01T00:00:00Z');
      expect(json['updatedAt'], '2024-01-01T00:00:00Z');
    });

    test('should create copy with updated values', () {
      final model = User(
        id: '1',
        name: 'Test User',
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      final updated = model.copyWith(name: 'Updated User');

      expect(updated.id, '1');
      expect(updated.name, 'Updated User');
      expect(updated.createdAt, model.createdAt);
      expect(updated.updatedAt, model.updatedAt);
    });

    test('should support equality comparison', () {
      final model1 = User(
        id: '1',
        name: 'Test User',
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      final model2 = User(
        id: '1',
        name: 'Test User',
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
      );

      expect(model1, equals(model2));
    });
  });
}
