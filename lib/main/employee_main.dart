import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/commodity_provider.dart';
import 'package:tugas_akhir_app/provider/employee_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/provider/payslip_provider.dart';
import 'package:tugas_akhir_app/screen/auth/login_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/add_commodity_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/commodity_screen.dart';
import 'package:tugas_akhir_app/screen/commodity/detail_commodity_screen.dart';
import 'package:tugas_akhir_app/screen/employee/employee_detail_order_screen.dart';
import 'package:tugas_akhir_app/screen/home_employee_screen.dart';
import 'package:tugas_akhir_app/screen/owner/payslip/detail_payslip_screen.dart';
import 'package:tugas_akhir_app/screen/splash_screen.dart';
import '../config/injection.dart' as di;

void main() {
  di.init();
  runApp(const EmployeeApp());
}

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.locator<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<EmployeeProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<CommodityProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<PayslipProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<OrderProvider>(),
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

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeEmployeeScreen(),
      routes: [
        GoRoute(
          path: 'more-commodity',
          name: 'more_commodity',
          builder: (context, state) {
            final storeId = state.extra as String;
            return CommodityScreen(storeId: storeId);
          },
          routes: [
            GoRoute(
              path: 'detail-commodity/:commodityId',
              name: 'detail_commodity',
              builder: (context, state) {
                final id = state.pathParameters['commodityId'];
                final storeId = state.extra as String;
                return DetailCommodityScreen(id: id!, storeId: storeId);
              },
            ),
            GoRoute(
              path: 'add-commodity',
              name: 'add_commodity',
              builder: (context, state) {
                final storeId = state.extra as String;
                return AddCommodityScreen(storeId: storeId);
              },
            )
          ],
        ),
        GoRoute(
          path: 'detail-commodity/:commodityId',
          name: 'detail_commodity_2',
          builder: (context, state) {
            final id = state.pathParameters['commodityId'];
            final storeId = state.pathParameters['id'];
            return DetailCommodityScreen(id: id!, storeId: storeId!);
          },
        ),
        GoRoute(
          path: 'detail-payslip/:id',
          name: 'detail_payslip',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return DetailPayslipScreen(id: id!);
          },
        ),
        GoRoute(
          path: 'detail-order/:id',
          name: 'detail_order',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return EmployeeDetailOrderScreen(orderId: id!);
          },
        )
      ],
    ),
  ],
);
