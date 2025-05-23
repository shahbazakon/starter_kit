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
  const NetworkFailure({required String message, int? code})
    : super(message: message, code: code);
}

/// Server related failures (e.g. 500 errors)
class ServerFailure extends Failure {
  const ServerFailure({required String message, int? code})
    : super(message: message, code: code);
}

/// Authentication related failures (e.g. 401 errors)
class AuthFailure extends Failure {
  const AuthFailure({required String message, int? code})
    : super(message: message, code: code);
}

/// Failures related to local cache operations
class CacheFailure extends Failure {
  const CacheFailure({required String message, int? code})
    : super(message: message, code: code);
}

/// Generic failures for unexpected errors
class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required String message, int? code})
    : super(message: message, code: code);
}
