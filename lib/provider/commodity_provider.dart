import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/commodity.dart';

class CommodityProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  CommodityProvider({required this.authRepository, required this.apiService});

  CommodityResponse? commodityResponse;

  LoadingState loadingState = const LoadingState.initial();

  List<Commodity> commodities = [];

  int? pageItems = 1;
  int sizeItems = 10;

  Future<void> getAllCommodity(
      {String? searchValue, required String storeId}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token is null');
        notifyListeners();
        return;
      }

      commodityResponse = await apiService.getCommodity(
        token: token,
        storeId: storeId,
        name: searchValue!,
      );

      if (commodityResponse!.success) {
        if (pageItems == 1) {
          commodities.clear();
        }
        commodities.addAll(commodityResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(commodityResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshCommodity({
    required String storeId,
    String searchValue = '',
  }) async {
    pageItems = 1;
    commodities.clear();
    await getAllCommodity(storeId: storeId, searchValue: searchValue);
  }
}
