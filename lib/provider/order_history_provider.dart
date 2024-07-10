import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/common/order_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/order_history.dart';

class OrderHistoryProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  OrderHistoryProvider(
      {required this.apiService, required this.authRepository});

  OrderHistoryResponse? orderHistoryResponse;

  LoadingState loadingState = const LoadingState.initial();
  OrderState orderState = const OrderState.initial();

  int page = 1;
  int pageSize = 10;

  List<OrderHistory> orderHistories = [];

  List<double> weeklyData = [];

  Future<void> getOrderHistory({String storeId = ''}) async {
    try {
      if (page == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      orderHistoryResponse = await apiService.getOrderHistory(
        token: token!,
        page: page,
        size: pageSize,
        storeId: storeId,
      );

      if (orderHistoryResponse!.success) {
        orderHistories = orderHistoryResponse!.result.data;
        weeklyData = orderHistoryResponse!.result.data
            .map((history) => history.orderDate.weekday.toDouble() - 1)
            .toList();
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(orderHistoryResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshOrderHistory({String storeId = ''}) async {
    page = 1;
    orderHistories = [];
    await getOrderHistory(storeId: storeId);
  }
}
