/// Generic API response model that can be used to parse any API response
/// [T] is the type of data expected in the response
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
  const ApiResponse({
    required this.success,
    this.message,
    this.code,
    this.data,
    this.errors,
  });

  /// Factory constructor for creating a new ApiResponse from JSON
  factory ApiResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(Object?)? fromJsonT,
  }) {
    return ApiResponse<T>(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data:
          fromJsonT != null && json['data'] != null
              ? fromJsonT(json['data'])
              : json['data'] as T?,
      errors:
          json['errors'] != null
              ? (json['errors'] as List).map((e) => e.toString()).toList()
              : null,
    );
  }

  /// Convert this ApiResponse to JSON
  Map<String, dynamic> toJson({Object? Function(T?)? toJsonT}) {
    return {
      'success': success,
      if (message != null) 'message': message,
      if (code != null) 'code': code,
      if (data != null) 'data': toJsonT != null ? toJsonT(data) : data,
      if (errors != null) 'errors': errors,
    };
  }

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

  /// Check if the response is successful
  bool get isSuccess => success;

  /// Check if the response has errors
  bool get hasError => !success;

  /// Get the first error message if available
  String? get errorMessage => message ?? errors?.first;

  /// Create a copy of this response with updated values
  ApiResponse<T> copyWith({
    bool? success,
    String? message,
    int? code,
    T? data,
    List<String>? errors,
  }) {
    return ApiResponse<T>(
      success: success ?? this.success,
      message: message ?? this.message,
      code: code ?? this.code,
      data: data ?? this.data,
      errors: errors ?? this.errors,
    );
  }

  @override
  String toString() {
    return 'ApiResponse{success: $success, message: $message, code: $code, data: $data, errors: $errors}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ApiResponse<T>) return false;
    return success == other.success &&
        message == other.message &&
        code == other.code &&
        data == other.data &&
        errors.toString() == other.errors.toString();
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        code.hashCode ^
        data.hashCode ^
        errors.hashCode;
  }
}
