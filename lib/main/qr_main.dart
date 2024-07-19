import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/provider/presence_provider.dart';
import 'package:tugas_akhir_app/provider/store_provider.dart';
import 'package:tugas_akhir_app/provider/user_provider.dart';
import 'package:tugas_akhir_app/screen/auth/login_screen.dart';
import 'package:tugas_akhir_app/screen/home_qr_screen.dart';
import 'package:tugas_akhir_app/screen/qr_screen.dart';
import 'package:tugas_akhir_app/screen/splash_screen.dart';
import '../config/injection.dart' as di;

void main() {
  di.init();
  runApp(const QrMain());
}

class QrMain extends StatelessWidget {
  const QrMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.locator<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<UserProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => di.locator<StoreProvider>(),
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
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeQrScreen(),
      routes: [
        GoRoute(
          path: ':storeId/qr',
          name: 'qr',
          builder: (context, state) {
            final storeId = state.pathParameters['storeId']!;
            final title = state.extra as String;
            return QrScreen(storeId: storeId, title: title);
          },
        ),
      ],
    )
  ],
);
