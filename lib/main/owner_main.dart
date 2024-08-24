import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/model/detail_commodity.dart';
import 'package:tugas_akhir_app/model/detail_hairstyle.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';
import 'package:tugas_akhir_app/model/service.dart';
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
import 'package:tugas_akhir_app/screen/auth/login_screen.dart';
import 'package:tugas_akhir_app/screen/auth/register_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/add_commodity_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/commodity_history_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/commodity_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/detail_commodity_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/update_commodity_screen.dart';
import 'package:tugas_akhir_app/screen/customer/edit_profile_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/edit_hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/owner/employee/add_employee_screen.dart';
import 'package:tugas_akhir_app/screen/owner/employee/detail_employee_screen.dart';
import 'package:tugas_akhir_app/screen/owner/employee/edit_employee_screen.dart';
import 'package:tugas_akhir_app/screen/owner/employee/employee_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/add_hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/detail_hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/home_owner_screen.dart';
import 'package:tugas_akhir_app/screen/owner/payslip/add_deduction_screen.dart';
import 'package:tugas_akhir_app/screen/owner/payslip/add_earning_screen.dart';
import 'package:tugas_akhir_app/screen/owner/payslip/add_payslip_screen.dart';
import 'package:tugas_akhir_app/screen/owner/payslip/detail_payslip_screen.dart';
import 'package:tugas_akhir_app/screen/owner/payslip/payslip_screen.dart';
import 'package:tugas_akhir_app/screen/owner/review/review_screen.dart';
import 'package:tugas_akhir_app/screen/owner/service/add_service_screen.dart';
import 'package:tugas_akhir_app/screen/owner/service/service_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/edit_store_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/maps_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/more_order_history_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/owner_detail_order_screen.dart';
import 'package:tugas_akhir_app/screen/splash_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/add_store_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/dashboard_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/detail_statistic_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/detail_store_screen.dart';
import 'package:tugas_akhir_app/screen/owner/store/more_employee_screen.dart';
import '../config/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  di.init();

  runApp(const OwnerApp());
}

class OwnerApp extends StatelessWidget {
  const OwnerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.locator<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<HomeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<StoreProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<EmployeeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<HairstyleProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<PayslipProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<CommodityProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<ServiceProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<ReviewProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<OrderHistoryProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<OrderProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<FavoriteProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<UserProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<PresenceProvider>(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
            centerTitle: true,
            scrolledUnderElevation: 0,
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeOwnerScreen(),
      routes: [
        GoRoute(
          path: 'dashboard',
          name: 'dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
            path: 'add-store',
            name: 'add_store',
            builder: (context, state) => const AddStoreScreen(),
            routes: [
              GoRoute(
                path: 'maps',
                name: 'maps',
                builder: (context, state) {
                  LatLng? location;

                  if (state.extra is Set<LatLng> &&
                      (state.extra as Set<LatLng>).isNotEmpty) {
                    location = (state.extra as Set<LatLng>).first;
                  } else {
                    location = state.extra as LatLng?;
                  }

                  if (location != null) {
                    return MapsScreen(initialLocation: location);
                  } else {
                    return const MapsScreen(initialLocation: LatLng(0.0, 0.0));
                  }
                },
              )
            ]),
        GoRoute(
          path: 'detail-store/:id',
          name: 'detail_store',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return DetailStoreScreen(id: id!);
          },
          routes: [
            GoRoute(
              path: 'detail-order/:orderId',
              name: 'detail_order',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                final orderId = state.pathParameters['orderId'];
                return OwnerDetailHistoryScreen(
                    storeId: storeId!, orderId: orderId!);
              },
            ),
            GoRoute(
              path: 'more-history',
              name: 'more_history',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                return MoreOrderHistoryScreen(storeId: storeId!);
              },
            ),
            GoRoute(
              path: 'detail-statistic',
              name: 'detail_statistic',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                return DetailStatisticScreen(storeId: storeId!);
              },
              routes: [
                GoRoute(
                  path: 'detail-order/:orderId',
                  name: 'detail_order2',
                  builder: (context, state) {
                    final storeId = state.pathParameters['id'];
                    final orderId = state.pathParameters['orderId'];
                    return OwnerDetailHistoryScreen(
                        storeId: storeId!, orderId: orderId!);
                  },
                ),
              ],
            ),
            GoRoute(
              path: 'more-employee',
              name: 'more_employee',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                return MoreEmployeeScreen(storeId: storeId!);
              },
            ),
            GoRoute(
              path: 'more-commodity',
              name: 'more_commodity',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                return CommodityScreen(storeId: storeId!);
              },
              routes: [
                GoRoute(
                    path: 'detail-commodity/:commodityId',
                    name: 'detail_commodity',
                    builder: (context, state) {
                      final id = state.pathParameters['commodityId'];
                      final storeId = state.pathParameters['id'];
                      return DetailCommodityScreen(id: id!, storeId: storeId!);
                    },
                    routes: [
                      GoRoute(
                        path: 'update-commodity',
                        name: 'update_commodity',
                        builder: (context, state) {
                          state.pathParameters['commodityId'];
                          final storeId = state.pathParameters['id'];
                          final extra =
                              (state.extra as Map<String, dynamic>)['commodity']
                                  as DetailCommodity?;
                          return UpdateCommodityScreen(
                            storeId: storeId!,
                            commodity: extra,
                          );
                        },
                      )
                    ]),
                GoRoute(
                  path: 'add-commodity',
                  name: 'add_commodity',
                  builder: (context, state) {
                    final storeId = state.pathParameters['id'];
                    return AddCommodityScreen(
                      storeId: storeId!,
                    );
                  },
                ),
                GoRoute(
                  path: 'history-commodity',
                  name: 'history_commodity',
                  builder: (context, state) {
                    final id = state.pathParameters['id'];
                    return CommodityHistoryScreen(storeId: id!);
                  },
                ),
              ],
            ),
            GoRoute(
                path: 'detail-commodity-2/:commodityId',
                name: 'detail_commodity_2',
                builder: (context, state) {
                  final id = state.pathParameters['commodityId'];
                  final storeId = state.pathParameters['id'];
                  return DetailCommodityScreen(id: id!, storeId: storeId!);
                },
                routes: [
                  GoRoute(
                    path: 'update-commodity-2',
                    name: 'update_commodity_2',
                    builder: (context, state) {
                      final storeId = state.pathParameters['id'];
                      state.pathParameters['commodityId'];
                      final extra =
                          (state.extra as Map<String, dynamic>)['commodity']
                              as DetailCommodity?;
                      return UpdateCommodityScreen(
                        storeId: storeId!,
                        commodity: extra,
                      );
                    },
                  )
                ]),
            GoRoute(
              path: 'more-service',
              name: 'more_service',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                return ServiceScreen(storeId: storeId!);
              },
              routes: [
                GoRoute(
                  path: 'add-service',
                  name: 'add_service',
                  builder: (context, state) {
                    final storeId = state.pathParameters['id'];
                    final extra = state.extra as Service?;
                    return AddServiceScreen(storeId: storeId!, service: extra);
                  },
                )
              ],
            ),
            GoRoute(
              path: 'more-review',
              name: 'more_review',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                return ReviewScreen(storeId: storeId!);
              },
            ),
            GoRoute(
              path: 'edit-store',
              name: 'edit_store',
              builder: (context, state) {
                final storeId = state.pathParameters['id'];
                final detailStore = state.extra as DetailStore;
                return EditStoreScreen(
                    storeId: storeId!, detailStore: detailStore);
              },
            ),
          ],
        ),
        GoRoute(
          path: 'employee',
          name: 'employee',
          builder: (context, state) => const EmployeeScreen(),
        ),
        GoRoute(
            path: 'detail-employee/:id',
            name: 'detail_employee',
            builder: (context, state) {
              final id = state.pathParameters['id'];
              return DetailEmployeeScreen(id: id!);
            },
            routes: [
              GoRoute(
                path: 'detail-payslip-employee/:employeeId',
                name: 'detail_payslip_employee',
                builder: (context, state) {
                  final id = state.pathParameters['id'];
                  final employeeId = state.pathParameters['employeeId'];
                  return DetailPayslipScreen(
                    id: id!,
                    employeeId: employeeId!,
                  );
                },
              ),
              GoRoute(
                path: 'change-store',
                name: 'change_store',
                builder: (context, state) {
                  final id = state.pathParameters['id'];
                  return EditEmployeeScreen(
                    id: id!,
                  );
                },
              ),
            ]),
        GoRoute(
          path: 'add-employee',
          name: 'add_employee',
          builder: (context, state) => const AddEmployeeScreen(),
        ),
        GoRoute(
          path: 'hairstyle',
          name: 'hairstyle',
          builder: (context, state) => const HairstyleScreen(),
        ),
        GoRoute(
            path: 'detail-hairstyle/:id',
            name: 'detail_hairstyle',
            builder: (context, state) {
              final id = state.pathParameters['id'];
              return DetailHairstyleScreen(id: id!);
            },
            routes: [
              GoRoute(
                path: 'edit-hairstyle',
                name: 'edit_hairstyle',
                builder: (context, state) {
                  state.pathParameters['id'];
                  final extra = state.extra as DetailHairstyle?;
                  return EditHairstyleScreen(
                    detailHairstyle: extra,
                  );
                },
              )
            ]),
        GoRoute(
          path: 'add-hairstyle',
          name: 'add_hairstyle',
          builder: (context, state) => const AddHairstyleScreen(),
        ),
        GoRoute(
          path: 'payslip',
          name: 'payslip',
          builder: (context, state) => const PayslipScreen(),
        ),
        GoRoute(
          path: 'add-payslip',
          name: 'add_payslip',
          builder: (context, state) => const AddPayslipScreen(),
          routes: [
            GoRoute(
              path: 'add-earning',
              name: 'add_earning',
              builder: (context, state) => const AddEarningScreen(),
            ),
            GoRoute(
              path: 'add-deduction',
              name: 'add_deduction',
              builder: (context, state) => const AddDeductionScreen(),
            ),
          ],
        ),
        GoRoute(
          path: 'detail-payslip/:id',
          name: 'detail_payslip',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return DetailPayslipScreen(
              id: id!,
              employeeId: id,
            );
          },
        ),
        GoRoute(
          path: 'edit-profile',
          name: 'edit_profile',
          builder: (context, state) {
            final Map<String, dynamic> extra =
                state.extra as Map<String, dynamic>;
            final String title = extra['title'] as String;
            final String user = extra['user'] as String;
            return EditProfileScreen(title: title, user: user);
          },
        ),
      ],
    )
  ],
);
