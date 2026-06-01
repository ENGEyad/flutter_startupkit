import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_startupkit/core/services/local_storage_service.dart';
import 'package:flutter_startupkit/core/theme/theme_cubit.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {}

void main() {
  late LocalStorageService storage;
  late ThemeCubit cubit;

  setUp(() {
    storage = MockLocalStorageService();
  });

  group('ThemeCubit', () {
    test('initial state from storage (light mode)', () {
      when(() => storage.getThemeMode()).thenReturn(false);
      cubit = ThemeCubit(storage);

      expect(cubit.state, false);
    });

    test('initial state from storage (dark mode)', () {
      when(() => storage.getThemeMode()).thenReturn(true);
      cubit = ThemeCubit(storage);

      expect(cubit.state, true);
    });

    test('toggleTheme emits true and persists', () async {
      when(() => storage.getThemeMode()).thenReturn(false);
      when(() => storage.saveThemeMode(true)).thenAnswer((_) async {});
      cubit = ThemeCubit(storage);

      expectLater(cubit.stream, emits(true));
      await cubit.toggleTheme();

      verify(() => storage.saveThemeMode(true)).called(1);
    });

    test('toggleTheme emits false and persists', () async {
      when(() => storage.getThemeMode()).thenReturn(true);
      when(() => storage.saveThemeMode(false)).thenAnswer((_) async {});
      cubit = ThemeCubit(storage);

      expectLater(cubit.stream, emits(false));
      await cubit.toggleTheme();

      verify(() => storage.saveThemeMode(false)).called(1);
    });
  });
}
