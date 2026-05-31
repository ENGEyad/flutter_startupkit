import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_startupkit/main.dart';
import 'package:flutter_startupkit/core/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUp(() async {
    // Mock SharedPreferences values for test environment
    SharedPreferences.setMockInitialValues({});
    
    // Ensure service locator is reset and initialized
    final getIt = GetIt.instance;
    await getIt.reset();
    await initServiceLocator();
  });

  testWidgets('Splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our splash screen titles are present.
    expect(find.text('FLUTTER STARTUP'), findsOneWidget);
    expect(find.text('Clean Feature-First Architecture'), findsOneWidget);

    // Let the animation and routing timer complete to prevent pending timer error
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
