import 'package:starter_kit/starter_kit.dart';
import '../../domain/repositories/user_service_repository.dart';

/// Implementation of UserServiceRepository
class UserServiceRepositoryImpl implements IUserServiceRepository {
  final ApiClient _apiClient;

  UserServiceRepositoryImpl(this._apiClient);

  @override
  Future<ApiResponse<List<Map<String, dynamic>>>> getAll() async {
    return await _apiClient.get<List<Map<String, dynamic>>>('/user_services');
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> getById(String id) async {
    return await _apiClient.get<Map<String, dynamic>>('/user_services/$id');
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> create(Map<String, dynamic> data) async {
    return await _apiClient.post<Map<String, dynamic>>('/user_services', data: data);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> update(String id, Map<String, dynamic> data) async {
    return await _apiClient.put<Map<String, dynamic>>('/user_services/$id', data: data);
  }

  @override
  Future<ApiResponse<void>> delete(String id) async {
    return await _apiClient.delete<void>('/user_services/$id');
  }
}
