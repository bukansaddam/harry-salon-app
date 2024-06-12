import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final actor = const String.fromEnvironment('actor', defaultValue: 'customer');

  bool get isCustomer => actor == 'customer';

  delayscreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      final authRepository = context.read<AuthProvider>();
      final isLoggedIn = await authRepository.authRepository.getState();

      if (isCustomer && mounted) {
        authRepository.checkIsLoggedIn();
        context.goNamed('home');
        return;
      }
      if (!isLoggedIn && mounted) {
        context.goNamed('login');
      } else if (isLoggedIn && mounted) {
        context.goNamed('home');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    delayscreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3B59BA), Color(0xFF354A98)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: Text(
          'Harry Salon',
          style: TextStyle(
            color: Colors.white,
            fontSize: 52,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
