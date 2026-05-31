import 'package:flutter_bloc/flutter_bloc.dart';
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
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}
