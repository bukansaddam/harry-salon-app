import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';

class StoreDetailProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;
  final String id;

  StoreDetailProvider({
    required this.authRepository,
    required this.apiService,
    required this.id,
  }) {
    getDetailStore(id);
  }

  DetailStoreResponse? detailStoreResponse;

  LoadingState loadingState = const LoadingState.initial();

  String? _message;
  String? get message => _message;

  Future<void> getDetailStore(String id) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      detailStoreResponse =
          await apiService.getDetailStore(token: token!, id: id);

      if (detailStoreResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(detailStoreResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }
}
