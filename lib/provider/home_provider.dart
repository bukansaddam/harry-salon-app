import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';

class HomeProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  HomeProvider({required this.apiService, required this.authRepository});

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  Future<void> onItemTapped(int index) async {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<bool> logout() async {
    try {
      await authRepository.deleteUser();
    } catch (e) {
      debugPrint(e.toString());
    }
    await authRepository.saveState(false);
    notifyListeners();

    return true;
  }
}
