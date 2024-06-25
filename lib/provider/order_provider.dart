import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/order.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider({
    required this.apiService,
    required this.authRepository,
  });

  final ApiService apiService;
  final AuthRepository authRepository;
  OrderResponse? orderResponse;

  LoadingState? loadingState = const LoadingState.initial();

  List<Order> orders = [];

  int pageItems = 1;
  int sizeItems = 10;

  int waitingTime = 0;
  Future<void> getOrder() async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('You are not logged in');
        notifyListeners();
        return;
      }

      orderResponse = await apiService.getCurrentOrder(
          token: token, page: pageItems, size: sizeItems);

      if (orderResponse!.success) {
        orders.addAll(
            orderResponse!.result.data.where((order) => order.isMe == true));
        waitingTime =
            orders.isNotEmpty ? (orders.first.orderNumber! - 1) * 15 : 0;
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(orderResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshOrder() async {
    pageItems = 1;
    orders = [];
    await getOrder();
  }
}
