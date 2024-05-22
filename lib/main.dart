import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/home_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/screen/dashboard/add_store_screen.dart';
import 'package:tugas_akhir_app/screen/dashboard/dashboard_screen.dart';
import 'package:tugas_akhir_app/screen/home_screen.dart';
import 'package:tugas_akhir_app/screen/login_screen.dart';
import 'package:tugas_akhir_app/screen/register_screen.dart';
import 'package:tugas_akhir_app/screen/splash_screen.dart';
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
        ChangeNotifierProvider(create: (context) => di.locator<AuthProvider>()),
        ChangeNotifierProvider(create: (context) => di.locator<HomeProvider>()),
        ChangeNotifierProvider(
            create: (context) => di.locator<StoreProvider>()),
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
                  fontSize: 20)),
        ),
        routerConfig: _router,
      ),
    );
  }
}
