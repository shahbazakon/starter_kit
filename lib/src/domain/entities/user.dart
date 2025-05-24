import 'package:equatable/equatable.dart';

/// Domain entity for User
class UserEntity extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
