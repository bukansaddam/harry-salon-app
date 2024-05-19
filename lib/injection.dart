import 'package:get_it/get_it.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/home_provider.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<AuthProvider>(
      () => AuthProvider(apiService: locator(), authRepository: locator()));
  locator.registerLazySingleton<HomeProvider>(
    () => HomeProvider(apiService: locator(), authRepository: locator()),
  );

  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
