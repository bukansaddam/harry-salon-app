import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/login.dart';
import 'package:tugas_akhir_app/model/register.dart';
import 'package:tugas_akhir_app/model/user.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  AuthProvider({required this.apiService, required this.authRepository});

  LoadingState loadingState = const LoadingState.initial();

  String? _message;
  String? get message => _message;

  Future<bool> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String address,
  }) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final RegisterResponse registerResponse = await apiService.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
        address: address,
      );

      if (registerResponse.success) {
        loadingState = const LoadingState.loaded();
        _message = registerResponse.message;

        final User user = User(
          email: email,
          token: registerResponse.token,
        );

        await authRepository.saveUser(user);
        await authRepository.saveState(true);

        notifyListeners();
        return true;
      } else {
        _message = registerResponse.message;
        loadingState = LoadingState.error(registerResponse.message);
        notifyListeners();
        return false;
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      _message = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final LoginResponse loginResponse = await apiService.login(
        email: email,
        password: password,
      );

      if (loginResponse.success) {
        loadingState = const LoadingState.loaded();
        _message = loginResponse.message;

        final User user = User(
          email: email,
          token: loginResponse.token,
        );

        await authRepository.saveUser(user);
        await authRepository.saveState(true);

        notifyListeners();
        return true;
      } else {
        _message = loginResponse.message;
        loadingState = LoadingState.error(loginResponse.message);
        notifyListeners();
        return false;
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      _message = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await authRepository.saveState(false);
    await authRepository.deleteUser();
    notifyListeners();
  }

  Future<bool> loginEmployee({
    required String email,
    required String password,
  }) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final LoginResponse loginResponse = await apiService.loginEmployee(
        email: email,
        password: password,
      );

      if (loginResponse.success) {
        loadingState = const LoadingState.loaded();
        _message = loginResponse.message;

        final User user = User(
          email: email,
          token: loginResponse.token,
          storeId: loginResponse.storeId,
        );

        await authRepository.saveUser(user);
        await authRepository.saveState(true);

        notifyListeners();
        return true;
      } else {
        _message = loginResponse.message;
        loadingState = LoadingState.error(loginResponse.message);
        notifyListeners();
        return false;
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      _message = e.toString();
      notifyListeners();
      return false;
    }
  }
}
