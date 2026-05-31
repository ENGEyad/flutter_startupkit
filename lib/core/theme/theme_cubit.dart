import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/local_storage_service.dart';

class ThemeCubit extends Cubit<bool> {
  final LocalStorageService _storageService;

  ThemeCubit(this._storageService) : super(_storageService.getThemeMode());

  void toggleTheme() {
    final newMode = !state;
    _storageService.saveThemeMode(newMode);
    emit(newMode);
  }
}
