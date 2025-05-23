import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

/// Generic API response model that can be used to parse any API response
/// [T] is the type of data expected in the response
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  /// Status of the response (success or error)
  final bool success;

  /// Optional message from the server
  final String? message;

  /// Optional error code from the server
  final int? code;

  /// The actual data returned by the API
  final T? data;

  /// If there are any errors in the response
  final List<String>? errors;

  /// Constructor for ApiResponse
  ApiResponse({
    required this.success,
    this.message,
    this.code,
    this.data,
    this.errors,
  });

  /// Factory constructor for creating a new ApiResponse from JSON
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  /// Convert this ApiResponse to JSON
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  /// Create a success response
  factory ApiResponse.success({T? data, String? message}) {
    return ApiResponse(success: true, data: data, message: message);
  }

  /// Create an error response
  factory ApiResponse.error({
    String? message,
    int? code,
    List<String>? errors,
  }) {
    return ApiResponse(
      success: false,
      message: message,
      code: code,
      errors: errors,
    );
  }
}
