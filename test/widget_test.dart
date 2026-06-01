import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_startupkit/main.dart';
import 'package:flutter_startupkit/core/di/service_locator.dart';
import 'package:flutter_startupkit/core/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final getIt = GetIt.instance;
    await getIt.reset();
    await initServiceLocator();
  });

  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(themeCubit: sl<ThemeCubit>()));

    expect(find.text('FLUTTER STARTUP'), findsOneWidget);
    expect(find.text('Clean Feature-First Architecture'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
