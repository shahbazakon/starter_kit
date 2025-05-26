import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/app_config.dart';
import '../../data/models/api_response.dart';

/// HTTP client for API requests
class ApiClient {
  late final Dio _dio;
  
  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.apiBaseUrl,
      connectTimeout: const Duration(milliseconds: AppConfig.apiTimeout),
      receiveTimeout: const Duration(milliseconds: AppConfig.apiTimeout),
      headers: AppConfig.defaultHeaders,
    ));
    
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
  }
  
  /// GET request
  Future<ApiResponse<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: $e');
    }
  }
  
  /// POST request
  Future<ApiResponse<T>> post<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(path, data: data, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: $e');
    }
  }
  
  /// PUT request
  Future<ApiResponse<T>> put<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(path, data: data, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: $e');
    }
  }
  
  /// DELETE request
  Future<ApiResponse<T>> delete<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, queryParameters: queryParameters);
      return ApiResponse.success(response.data as T);
    } on DioException catch (e) {
      return ApiResponse.error(_handleError(e));
    } catch (e) {
      return ApiResponse.error('Unexpected error: $e');
    }
  }
  
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message'] ?? 'Unknown server error';
        return 'Server error ($statusCode): $message';
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return 'No internet connection';
        }
        return 'Network error occurred';
      default:
        return 'An unexpected error occurred';
    }
  }
}
