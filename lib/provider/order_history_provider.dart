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
  List<OrderHistory> selectedDaysOrder = [];

  List<double> weeklyData = [];
  List<int> dates = [];

  int totalOrder = 0;
  int totalIncome = 0;

  Future<void> getOrderHistory(
      {String storeId = '', String dateStart = '', String dateEnd = ''}) async {
    try {
      if (page == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('You must login first');
        notifyListeners();
        return;
      }

      orderHistoryResponse = await apiService.getOrderHistory(
        token: token,
        page: page,
        size: pageSize,
        storeId: storeId,
        dateStart: dateStart,
        dateEnd: dateEnd,
      );

      if (orderHistoryResponse!.success) {
        weeklyData = [];
        orderHistories = orderHistoryResponse!.result.data;

        getDataGraph();

        totalIncome = orderHistoryResponse!.result.data.where(
          (element) {
            return element.status == 'done';
          },
        ).fold(0,
            (previousValue, element) => previousValue + element.servicePrice);
        notifyListeners();

        totalOrder = orderHistoryResponse!.result.data.where(
          (element) {
            return element.storeId == storeId;
          },
        ).length;
        notifyListeners();

        loadingState = const LoadingState.loaded();
        debugPrint(weeklyData.toString());
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

  void getDataGraph() {
    weeklyData = orderHistoryResponse!.result.graph!
        .map((e) => e.count.toDouble())
        .toList();
    dates = orderHistoryResponse!.result.graph!
        .map((e) => int.parse(e.date))
        .toList();
  }

  Future<void> refreshOrderHistory(
      {String storeId = '',
      String dateStart = '',
      String dateEnd = '',
      int date = 0}) async {
    if (date != 0) {
      getOrderByDate(date: date);
    } else {
      page = 1;
      orderHistories = [];
      await getOrderHistory(
          storeId: storeId, dateStart: dateStart, dateEnd: dateEnd);
    }
  }

  Future<void> getOrderByDate({required int date}) async {
    selectedDaysOrder = orderHistories
        .where((element) => element.orderDate.day == date)
        .toList();
    notifyListeners();
  }

  Future<void> clearSelectedDaysOrder() async {
    selectedDaysOrder.clear();
    notifyListeners();
  }
}
