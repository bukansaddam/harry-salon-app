import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_user.dart';

class UserProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  UserProvider({
    required this.authRepository,
    required this.apiService,
  }) {
    getDetailUser();
  }

  LoadingState loadingState = const LoadingState.initial();

  DetailUserResponse? userDetailResponse;

  Future<void> getDetailUser() async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token not found');
        notifyListeners();
        return;
      }

      userDetailResponse = await apiService.getDetailUser(token: token);

      if (userDetailResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(userDetailResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }
}
