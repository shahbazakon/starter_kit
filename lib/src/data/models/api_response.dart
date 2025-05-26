/// Generic API response wrapper
class ApiResponse<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;
  
  const ApiResponse._({
    this.data,
    this.errorMessage,
    required this.isSuccess,
  });
  
  /// Create successful response
  factory ApiResponse.success(T data) {
    return ApiResponse._(data: data, isSuccess: true);
  }
  
  /// Create error response
  factory ApiResponse.error(String message) {
    return ApiResponse._(errorMessage: message, isSuccess: false);
  }
  
  /// Check if response has data
  bool get hasData => data != null;
  
  /// Check if response has error
  bool get hasError => errorMessage != null;
  
  /// Create copy with different values
  ApiResponse<T> copyWith({
    T? data,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return ApiResponse._(
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
  
  @override
  String toString() {
    if (isSuccess) {
      return 'ApiResponse.success(data: $data)';
    } else {
      return 'ApiResponse.error(message: $errorMessage)';
    }
  }
}
