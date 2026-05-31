import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DioClient _dioClient;

  DashboardRepositoryImpl(this._dioClient);

  @override
  Future<List<dynamic>> fetchPosts() async {
    final response = await _dioClient.get('https://jsonplaceholder.typicode.com/posts?_limit=5');
    if (response.data is List) {
      return response.data as List;
    }
    throw Exception('Unexpected response format');
  }
}
