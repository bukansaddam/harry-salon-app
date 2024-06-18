import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/hairstyle_provider.dart';
import 'package:tugas_akhir_app/provider/order_provider.dart';
import 'package:tugas_akhir_app/provider/service_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/provider/user_provider.dart';
import 'package:tugas_akhir_app/screen/auth/login_screen.dart';
import 'package:tugas_akhir_app/screen/auth/register_screen.dart';
import 'package:tugas_akhir_app/screen/customer/add_order_screen.dart';
import 'package:tugas_akhir_app/screen/customer/edit_profile_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/detail_hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/hairstyle/hairstyle_screen.dart';
import 'package:tugas_akhir_app/screen/home_customer_screen.dart';
import 'package:tugas_akhir_app/screen/splash_screen.dart';
import '../config/injection.dart' as di;

void main() {
  di.init();
  runApp(const CustomerApp());
}

class CustomerApp extends StatelessWidget {
  const CustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.locator<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<HairstyleProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<UserProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<StoreProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<OrderProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<ServiceProvider>(),
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
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) {
          return const HomeCustomerScreen();
        },
        routes: [
          GoRoute(
            path: 'all/hairstyle',
            name: 'more_hairstyle',
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
          GoRoute(
            path: 'order',
            name: 'order',
            builder: (context, state) {
              final String extra = state.extra as String;
              return AddOrderScreen(location: extra);
            },
          )
        ]),
  ],
);
