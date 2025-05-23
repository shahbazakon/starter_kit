import 'package:equatable/equatable.dart';

/// Base failure class for domain level errors
abstract class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];
}

/// Network related failures
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

/// Server related failures (e.g. 500 errors)
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

/// Authentication related failures (e.g. 401 errors)
class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.code});
}

/// Failures related to local cache operations
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

/// Generic failures for unexpected errors
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.message, super.code});
}
