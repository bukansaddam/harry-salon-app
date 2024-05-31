import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/provider/home_provider.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/employee/add_employee_screen.dart';
import 'package:tugas_akhir_app/screen/employee/detail_employee_screen.dart';
import 'package:tugas_akhir_app/screen/employee/employee_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/add_hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/detail_hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/payslip/add_deduction_screen.dart';
import 'package:tugas_akhir_app/screen/payslip/add_earning_screen.dart';
import 'package:tugas_akhir_app/screen/payslip/add_payslip_screen.dart';
import 'package:tugas_akhir_app/screen/payslip/detail_payslip_screen.dart';
import 'package:tugas_akhir_app/screen/payslip/payslip_screen.dart';
import 'package:tugas_akhir_app/screen/store/add_store_screen.dart';
import 'package:tugas_akhir_app/screen/store/dashboard_screen.dart';
import 'package:tugas_akhir_app/screen/home_screen.dart';
import 'package:tugas_akhir_app/screen/auth/login_screen.dart';
import 'package:tugas_akhir_app/screen/auth/register_screen.dart';
import 'package:tugas_akhir_app/screen/splash_screen.dart';
import 'package:tugas_akhir_app/screen/store/detail_statistic_screen.dart';
import 'package:tugas_akhir_app/screen/store/detail_store_screen.dart';
import 'package:tugas_akhir_app/screen/store/more_employee_screen.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(initialLocation: '/', routes: [
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
    builder: (context, state) => const HomeScreen(),
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
      ),
      GoRoute(
        path: 'detail-store/:id',
        name: 'detail_store',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return DetailStoreScreen(id: id!);
        },
        routes: [
          GoRoute(
            path: 'detail-statistic',
            name: 'detail_statistic',
            builder: (context, state) => const DetailStatisticScreen(),
          ),
          GoRoute(
            path: 'more-employee',
            name: 'more_employee',
            builder: (context, state) {
              final storeId = state.pathParameters['id'];
              return MoreEmployeeScreen(storeId: storeId!);
            },
          )
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
      ),
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
      ),
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
          return DetailPayslipScreen(id: id!);
        },
      )
    ],
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
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
