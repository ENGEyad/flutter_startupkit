import '../../../../core/error/failures.dart';

abstract class DashboardRepository {
  Future<List<dynamic>> fetchPosts();
}
