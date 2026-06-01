import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_startupkit/core/error/failures.dart';
import 'package:flutter_startupkit/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:flutter_startupkit/features/dashboard/presentation/controllers/dashboard_cubit.dart';
import 'package:flutter_startupkit/features/dashboard/presentation/controllers/dashboard_state.dart';
import 'package:flutter_startupkit/features/dashboard/data/models/post.dart';

class MockDashboardRepository extends Mock implements DashboardRepository {}

void main() {
  late DashboardRepository repository;
  late DashboardCubit cubit;

  setUp(() {
    repository = MockDashboardRepository();
    cubit = DashboardCubit(repository);
  });

  group('DashboardCubit', () {
    test('initial state is DashboardInitial', () {
      expect(cubit.state, isA<DashboardInitial>());
    });

    test('emits [DashboardLoading, DashboardLoaded] on success', () async {
      final posts = [
        const Post(id: 1, title: 'Test Title', body: 'Test Body'),
      ];
      when(() => repository.fetchPosts()).thenAnswer((_) async => posts);

      final expected = [DashboardLoading(), DashboardLoaded(posts)];
      expectLater(cubit.stream, emitsInOrder(expected));

      await cubit.fetchPosts();
    });

    test('emits [DashboardLoading, DashboardError] on Failure', () async {
      when(() => repository.fetchPosts()).thenThrow(
        const ServerFailure('Something went wrong'),
      );

      final expected = [
        DashboardLoading(),
        const DashboardError('Something went wrong'),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));

      await cubit.fetchPosts();
    });

    test('emits [DashboardLoading, DashboardError] on unexpected error', () async {
      when(() => repository.fetchPosts()).thenThrow('raw string error');

      final expected = [
        DashboardLoading(),
        const DashboardError('An unexpected error occurred. Please try again.'),
      ];
      expectLater(cubit.stream, emitsInOrder(expected));

      await cubit.fetchPosts();
    });
  });
}
