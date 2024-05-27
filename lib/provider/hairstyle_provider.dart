import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';

class HairstyleProvider extends ChangeNotifier {
  ApiService apiService;
  AuthRepository authRepository;

  HairstyleProvider({required this.apiService, required this.authRepository});

  LoadingState loadingState = const LoadingState.initial();

  HairstyleResponse? hairstyleResponse;

  List<Hairstyle> hairstyles = [];

  int? pageItems = 1;
  int sizeItems = 10;

  Future<void> getAllHairstyle({String? searchValue}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      hairstyleResponse = await apiService.getAllHairstyle(
        token: token!,
        page: pageItems!,
        size: sizeItems,
        name: searchValue ?? '',
      );

      if (hairstyleResponse!.success) {
        if (pageItems == 1) {
          hairstyles.clear();
        }
        hairstyles.addAll(hairstyleResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (hairstyleResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(hairstyleResponse!.message);
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
    }
  }

  Future<void> refreshHairstyle({String? searchValue}) async {
    pageItems = 1;
    hairstyles.clear();
    await getAllHairstyle(searchValue: searchValue);
  }
}
