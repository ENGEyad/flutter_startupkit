import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize all dependencies in our service locator
  await initServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp.router(
            title: 'Flutter Startup Kit',
            debugShowCheckedModeBanner: false,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
