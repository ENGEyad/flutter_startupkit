import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:flutter_startupkit/core/error/failures.dart';
import 'package:flutter_startupkit/core/network/dio_client.dart';
import 'package:flutter_startupkit/features/dashboard/data/datasources/post_remote_data_source.dart';
import 'package:flutter_startupkit/features/dashboard/data/models/post.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {
  late DioClient dioClient;
  late PostRemoteDataSource dataSource;

  setUp(() {
    dioClient = MockDioClient();
    dataSource = PostRemoteDataSource(dioClient);
  });

  group('PostRemoteDataSource', () {
    test('fetchPosts returns List<Post> on success', () async {
      final responseData = [
        {'id': 1, 'title': 'Test Title', 'body': 'Test Body'},
        {'id': 2, 'title': 'Another Post', 'body': 'More content here'},
      ];
      when(() => dioClient.get(any())).thenAnswer(
        (_) async => Response(
          data: responseData,
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
        ),
      );

      final result = await dataSource.fetchPosts();

      expect(result, isA<List<Post>>());
      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[0].title, 'Test Title');
      expect(result[0].body, 'Test Body');
      expect(result[1].title, 'Another Post');
    });

    test('fetchPosts throws ServerFailure on invalid format', () async {
      when(() => dioClient.get(any())).thenAnswer(
        (_) async => Response(
          data: 'not a list',
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
        ),
      );

      expect(
        () => dataSource.fetchPosts(),
        throwsA(isA<ServerFailure>()),
      );
    });

    test('fetchPosts throws Failure from DioClient', () async {
      when(() => dioClient.get(any())).thenThrow(
        const NetworkFailure('No internet connection'),
      );

      expect(
        () => dataSource.fetchPosts(),
        throwsA(isA<NetworkFailure>()),
      );
    });
  });
}
