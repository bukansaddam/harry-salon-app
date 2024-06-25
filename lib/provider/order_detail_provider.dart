import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/common/order_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_order.dart';

class DetailOrderProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;
  final String id;

  DetailOrderProvider({
    required this.apiService,
    required this.authRepository,
    required this.id,
  }) {
    getDetailOrder(id: id);
  }

  DetailOrderResponse? detailOrderResponse;

  LoadingState loadingState = const LoadingState.initial();
  OrderState orderState = const OrderState.initial();

  bool isOnLocation = false;

  Future<void> getDetailOrder({required String id}) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token is null');
        notifyListeners();
        return;
      }

      detailOrderResponse = await apiService.getDetailOrder(
        id: id,
        token: token,
      );

      if (detailOrderResponse!.success) {
        _checkOrderState(detailOrderResponse!.data.status);
        isOnLocation = detailOrderResponse!.data.isOnLocation;
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(detailOrderResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  void _checkOrderState(String status) {
    if (status == 'pending') {
      orderState = const OrderState.pending();
      notifyListeners();
    } else if (status == 'waiting') {
      orderState = const OrderState.waiting();
      notifyListeners();
    } else if (status == 'onProcess') {
      orderState = const OrderState.onProcress();
      notifyListeners();
    } else if (status == 'done') {
      orderState = const OrderState.done();
      notifyListeners();
    } else if (status == 'canceled') {
      orderState = const OrderState.canceled();
      notifyListeners();
    }
  }

  Future<void> updateLocation() async {
    isOnLocation = !isOnLocation;
    notifyListeners();
  }
}
