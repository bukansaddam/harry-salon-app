import 'package:get_it/get_it.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/provider/favorite_provider.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/provider/home_provider.dart';
import 'package:tugas_akhir_app/provider/order_history_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/provider/presence_provider.dart';
import 'package:tugas_akhir_app/provider/review_provider.dart';
import 'package:tugas_akhir_app/provider/service_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/provider/user_provider.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<AuthProvider>(
    () => AuthProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<HomeProvider>(
    () => HomeProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<StoreProvider>(
    () => StoreProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<EmployeeProvider>(
    () => EmployeeProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<HairstyleProvider>(
    () => HairstyleProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<PayslipProvider>(
    () => PayslipProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<CommodityProvider>(
    () => CommodityProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<ServiceProvider>(
    () => ServiceProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<ReviewProvider>(
    () => ReviewProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<UserProvider>(
    () => UserProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<OrderProvider>(
    () => OrderProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<FavoriteProvider>(
    () => FavoriteProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<OrderHistoryProvider>(
    () =>
        OrderHistoryProvider(apiService: locator(), authRepository: locator()),
  );
  locator.registerLazySingleton<PresenceProvider>(
    () => PresenceProvider(apiService: locator(), authRepository: locator()),
  );

  locator.registerLazySingleton<ApiService>(() => ApiService());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
