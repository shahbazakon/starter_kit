import 'package:starter_kit/starter_kit.dart';

/// Repository interface for UserService
abstract class IUserServiceRepository {
  Future<ApiResponse<List<Map<String, dynamic>>>> getAll();
  Future<ApiResponse<Map<String, dynamic>>> getById(String id);
  Future<ApiResponse<Map<String, dynamic>>> create(Map<String, dynamic> data);
  Future<ApiResponse<Map<String, dynamic>>> update(String id, Map<String, dynamic> data);
  Future<ApiResponse<void>> delete(String id);
}
