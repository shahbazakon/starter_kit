import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../data/models/api_response.dart';
import '../../domain/entities/failure.dart';
import '../config/app_config.dart';

/// API Client for handling network requests using Dio.
class ApiClient {
  /// Dio instance for making HTTP requests
  final Dio _dio;

  /// Logger instance for logging requests and responses
  final Logger _logger;

  /// Creates an instance of ApiClient with the given configuration
  ApiClient({
    required String baseUrl,
    required Logger logger,
    Map<String, dynamic>? headers,
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
    List<Interceptor>? interceptors,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: Duration(milliseconds: connectTimeout),
           receiveTimeout: Duration(milliseconds: receiveTimeout),
           headers: headers,
         ),
       ),
       _logger = logger {
    // Add interceptors if provided
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }

    // Add logging interceptor
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => _logger.d(obj.toString()),
      ),
    );
  }

  /// Factory constructor to create an API client from app config
  factory ApiClient.fromConfig(AppConfig config, Logger logger) {
    return ApiClient(
      baseUrl: config.apiBaseUrl,
      logger: logger,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  /// Make a GET request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [queryParameters] Optional query parameters for the request
  /// [options] Additional request options
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Make a POST request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [data] The data to send in the request body
  /// [queryParameters] Optional query parameters for the request
  /// [options] Additional request options
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Make a PUT request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [data] The data to send in the request body
  /// [queryParameters] Optional query parameters for the request
  /// [options] Additional request options
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Make a DELETE request to the specified endpoint
  ///
  /// [endpoint] The API endpoint to call
  /// [data] The data to send in the request body
  /// [queryParameters] Optional query parameters for the request
  /// [options] Additional request options
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return _parseResponse<T>(response);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Parse the API response
  ApiResponse<T> _parseResponse<T>(Response<Map<String, dynamic>> response) {
    try {
      final data = response.data;

      if (data == null) {
        return ApiResponse.error(message: 'No data received');
      }

      // Check if the response contains a success field
      if (data.containsKey('success')) {
        final bool success = data['success'] as bool;

        if (success) {
          return ApiResponse<T>.success(
            data: data['data'] as T?,
            message: data['message'] as String?,
          );
        } else {
          return ApiResponse<T>.error(
            message: data['message'] as String?,
            code: data['code'] as int?,
            errors:
                data['errors'] != null
                    ? (data['errors'] as List).map((e) => e.toString()).toList()
                    : null,
          );
        }
      }

      // If the response doesn't contain a success field, assume it's successful
      // and pass the entire data object as the response data
      return ApiResponse<T>.success(data: data as T?);
    } catch (e) {
      _logger.e('Error parsing response: $e');
      return ApiResponse.error(message: 'Failed to parse response');
    }
  }

  /// Handle API error
  ApiResponse<T> _handleError<T>(dynamic error) {
    _logger.e('API Error: $error');

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiResponse.error(
            message: 'Connection timeout. Please try again.',
            code: -1,
          );

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final responseData = error.response?.data;

          if (statusCode == 401) {
            return ApiResponse.error(
              message: 'Unauthorized access. Please login again.',
              code: statusCode,
            );
          } else if (statusCode == 404) {
            return ApiResponse.error(
              message: 'Resource not found.',
              code: statusCode,
            );
          } else if (statusCode != null && statusCode >= 500) {
            return ApiResponse.error(
              message: 'Server error. Please try again later.',
              code: statusCode,
            );
          }

          if (responseData is Map<String, dynamic> &&
              responseData.containsKey('message')) {
            return ApiResponse.error(
              message: responseData['message'] as String?,
              code: statusCode,
            );
          }

          return ApiResponse.error(
            message: 'Unknown server error occurred.',
            code: statusCode,
          );

        case DioExceptionType.cancel:
          return ApiResponse.error(message: 'Request was cancelled', code: -2);

        case DioExceptionType.unknown:
        default:
          if (error.error is NetworkFailure) {
            return ApiResponse.error(
              message:
                  'Network connection error. Please check your connection.',
              code: -3,
            );
          }
          return ApiResponse.error(
            message: 'An unexpected error occurred',
            code: -100,
          );
      }
    }

    return ApiResponse.error(
      message: 'An unexpected error occurred',
      code: -999,
    );
  }
}
