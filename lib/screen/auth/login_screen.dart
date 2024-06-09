import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final actor = const String.fromEnvironment('actor', defaultValue: 'customer');

  bool get isOwner => actor == 'owner';
  bool get isEmployee => actor == 'employee';
  bool get isCustomer => actor == 'customer';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Hey, \nWelcome \nBack!',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    fontFamily: 'Montserrat',
                    color: Color(0xFF3B59BA),
                  ),
                ),
                const SizedBox(height: 84),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                          controller: _passwordController,
                          labelText: 'Password',
                          isObscureText: true),
                      const SizedBox(height: 60),
                      context.watch<AuthProvider>().loadingState.when(
                            initial: () => CustomButton(
                                function: _onSubmit, text: 'Login'),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loaded: () => CustomButton(
                                function: _onSubmit, text: 'Login'),
                            error: (message) => CustomButton(
                                function: _onSubmit, text: 'Login'),
                          ),
                    ],
                  ),
                ),
                isCustomer
                    ? Column(
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Dont have an account ? ',
                                  ),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                        color: Color(0xFF3B59BA)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                          () => context.goNamed('register'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() async {
    final provider = context.read<AuthProvider>();
    if (formKey.currentState!.validate()) {
      bool result = false;

      if (isOwner) {
        result = await provider.login(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else if (isEmployee) {
        result = await provider.loginEmployee(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        // result = await provider.loginCustomer(
        //   email: _emailController.text,
        //   password: _passwordController.text,
        // );
      }

      if (result && mounted) {
        _showMessage(context, 'Login Success');
        context.goNamed('home');
      } else {
        if (mounted) {
          _showMessage(context, provider.message!);
        }
      }
    }
  }

  void _showMessage(BuildContext context, String message) {
    DelightToastBar(
      autoDismiss: true,
      builder: (context) => ToastCard(
        leading: const Icon(Icons.ac_unit_rounded),
        title: Text(message),
      ),
      position: DelightSnackbarPosition.top,
      snackbarDuration: const Duration(seconds: 3),
    ).show(context);
  }
}
