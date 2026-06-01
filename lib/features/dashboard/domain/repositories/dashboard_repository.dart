import '../../data/models/post.dart';

abstract class DashboardRepository {
  Future<List<Post>> fetchPosts();
}
