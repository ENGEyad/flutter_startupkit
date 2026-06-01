import '../datasources/post_remote_data_source.dart';
import '../models/post.dart';
import '../../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final PostRemoteDataSource _dataSource;

  DashboardRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> fetchPosts() async {
    return _dataSource.fetchPosts();
  }
}
