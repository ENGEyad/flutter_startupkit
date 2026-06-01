import '../../../../core/error/failures.dart';
import '../../../../core/network/api_config.dart';
import '../../../../core/network/dio_client.dart';
import '../models/post.dart';

class PostRemoteDataSource {
  final DioClient _client;

  PostRemoteDataSource(this._client);

  Future<List<Post>> fetchPosts() async {
    final response = await _client.get(
      '${ApiConfig.baseUrl}${ApiConfig.postsEndpoint}?_limit=${ApiConfig.postsLimit}',
    );
    if (response.data is List) {
      return (response.data as List)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw const ServerFailure('Unexpected response format');
  }
}
