import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_startupkit/core/error/failures.dart';
import '../../domain/repositories/dashboard_repository.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository;

  DashboardCubit(this._repository) : super(DashboardInitial());

  Future<void> fetchPosts() async {
    emit(DashboardLoading());
    try {
      final posts = await _repository.fetchPosts();
      emit(DashboardLoaded(posts));
    } on Failure catch (f) {
      emit(DashboardError(f.message));
    } catch (e) {
      emit(const DashboardError('An unexpected error occurred. Please try again.'));
    }
  }
}
