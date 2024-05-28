import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_hairstyle.dart';

class HairstyleDetailProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;
  final String id;

  HairstyleDetailProvider(
      {required this.apiService, required this.authRepository, required this.id}) {
    getDetailHairstyle(id);
  }

  LoadingState loadingState = const LoadingState.initial();

  DetailHairstyleResponse? detailHairstyleResponse;

  Future<void> getDetailHairstyle(String id) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      detailHairstyleResponse = await apiService.getDetailHairstyle(
        token: token!,
        id: id,
      );

      if (detailHairstyleResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(detailHairstyleResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }
}
