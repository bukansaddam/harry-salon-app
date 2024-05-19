import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  delayscreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      final authRepository = context.read<AuthProvider>().authRepository;
      final isLoggedIn = await authRepository.getState();
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
    return const Center(
      child: Text(
        'Harry Styles',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
