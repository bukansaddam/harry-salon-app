import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_commodity.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class DetailCommodityProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;
  final String id;

  DetailCommodityProvider(
      {required this.authRepository,
      required this.apiService,
      required this.id}) {
    getDetail(id: id);
  }

  LoadingState loadingState = const LoadingState.initial();

  DetailCommodityResponse? detailCommodityResponse;
  UploadResponse? uploadResponse;

  int? commodityStock = 0;
  int? currentStock = 0;

  Future<void> getDetail({
    required String id,
  }) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      detailCommodityResponse =
          await apiService.getDetailCommodity(token: token!, id: id);

      if (detailCommodityResponse!.success) {
        loadingState = const LoadingState.loaded();
        commodityStock = detailCommodityResponse!.data.stock;
        currentStock = detailCommodityResponse!.data.stock;
        notifyListeners();
      } else {
        loadingState = LoadingState.error(detailCommodityResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> increaseStock() {
    commodityStock = commodityStock! + 1;
    notifyListeners();
    return Future.value();
  }

  Future<void> decreaseStock() {
    if (commodityStock! > 0) {
      commodityStock = commodityStock! - 1;
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> updateStock({required int stock}) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      final response = await apiService.updateCommodityStock(
        token: token!,
        id: id,
        stock: stock,
      );

      if (response.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(response.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }
}
