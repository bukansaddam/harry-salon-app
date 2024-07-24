import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir_app/provider/auth_provider.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';
import 'package:tugas_akhir_app/screen/widgets/text_field.dart';
import 'package:tugas_akhir_app/screen/widgets/toast_message.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  'Let\'s Get \nStarted!',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    fontFamily: 'Montserrat',
                    color: Color(0xFF3B59BA),
                  ),
                ),
                const SizedBox(height: 60),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _nameController, labelText: 'Name'),
                      const SizedBox(height: 12),
                      CustomTextField(
                          controller: _phoneController,
                          labelText: 'Phone Number',
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                      const SizedBox(height: 12),
                      CustomTextField(
                          controller: _addressController, labelText: 'Address'),
                      const SizedBox(height: 12),
                      CustomTextField(
                          controller: _emailController,
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        isObscureText: true,
                        counter: true,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: _confirmPasswordController,
                        labelText: 'Confirm Password',
                        isObscureText: true,
                        counter: true,
                      ),
                      const SizedBox(height: 60),
                      context.watch<AuthProvider>().loadingState.when(
                            initial: () => CustomButton(
                                function: _onRegister, text: 'Register'),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            loaded: () => CustomButton(
                                function: _onRegister, text: 'Register'),
                            error: (message) => CustomButton(
                                function: _onRegister, text: 'Register'),
                          ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Already have an account ? ',
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: const TextStyle(color: Color(0xFF3B59BA)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.goNamed('login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onRegister() async {
    final provider = context.read<AuthProvider>();

    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final name = _nameController.text;
    final phone = _phoneController.text;
    final address = _addressController.text;

    if (formKey.currentState!.validate()) {
      if (password != confirmPassword) {
        ToastMessage.show(context, 'Password not match');
        return;
      }

      if (phone.length < 10 || phone.length > 14) {
        ToastMessage.show(context, 'Phone number not valid');
        return;
      }

      await provider
          .register(
        email: email,
        password: password,
        name: name,
        phone: phone,
        address: address,
      )
          .then((_) {
        if (provider.registerResponse!.success) {
          context.goNamed('login');
          ToastMessage.show(context, provider.registerResponse!.message);
        } else {
          ToastMessage.show(context, provider.registerResponse!.message);
        }
      }).catchError((error) {
        ToastMessage.show(context, error.toString());
      });
    }
  }
}
