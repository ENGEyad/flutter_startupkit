import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/dashboard/data/datasources/post_remote_data_source.dart';
import '../../features/dashboard/data/repositories/dashboard_repository_impl.dart';
import '../../features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../features/dashboard/presentation/controllers/dashboard_cubit.dart';
import '../network/dio_client.dart';
import '../services/local_storage_service.dart';
import '../theme/theme_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // 1. External Services
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());

  // 2. Core services & Client wrappers
  sl.registerLazySingleton<LocalStorageService>(
    () => LocalStorageService(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<DioClient>(
    () => DioClient(sl<Dio>()),
  );

  // 3. Core State Controllers
  sl.registerFactory<ThemeCubit>(() => ThemeCubit(sl<LocalStorageService>()));

  // 4. Data Sources
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSource(sl<DioClient>()),
  );

  // 5. Feature Repositories
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(sl<PostRemoteDataSource>()),
  );

  // 6. Feature State Controllers
  sl.registerFactory<DashboardCubit>(
    () => DashboardCubit(sl<DashboardRepository>()),
  );
}
