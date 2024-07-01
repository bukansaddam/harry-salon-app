import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/order.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider({
    required this.apiService,
    required this.authRepository,
  });

  final ApiService apiService;
  final AuthRepository authRepository;
  OrderResponse? orderResponse;
  UploadResponse? uploadResponse;

  LoadingState loadingState = const LoadingState.initial();

  List<Order> orders = [];
  Order? upcomingTask;

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
        token: token,
        page: pageItems,
        size: sizeItems,
      );

      if (orderResponse!.success) {
        orders.addAll(
            orderResponse!.result!.data.where((order) => order.isMe == true));
        waitingTime = orders.isNotEmpty
            ? orders.first.orderNumber != 0
                ? (orders.first.orderNumber! - 1) * 15
                : 0
            : 0;
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

  Future<void> updateStatusOrder(
      {required String id,
      String? status,
      bool? isOnLocation,
      bool? isAccepted}) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('You are not logged in');
        notifyListeners();
        return;
      }

      final response = await apiService.updateStatusOrder(
          token: token,
          id: id,
          status: status,
          isOnLocation: isOnLocation,
          isAccepted: isAccepted);

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

  Future<bool> createOrder({
    required String storeId,
    required String serviceId,
    required String description,
    String? hairstyleId,
  }) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      uploadResponse = await apiService.createOrder(
        token: token!,
        storeId: storeId,
        serviceId: serviceId,
        description: description,
        hairstyleId: hairstyleId ?? '',
        date: DateTime.now().toString(),
      );

      if (uploadResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
        return true;
      } else {
        loadingState = LoadingState.error(uploadResponse!.message);
        notifyListeners();
        return false;
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
      return false;
    }
  }

  Future<void> getOrderEmployee({bool isMoreUpcoming = false}) async {
    try {
      if (isMoreUpcoming) {
        if (pageItems == 1) {
          loadingState = const LoadingState.loading();
          notifyListeners();
        }
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('You are not logged in');
        notifyListeners();
        return;
      }

      orderResponse = await apiService.getCurrentOrder(
        token: token,
        page: pageItems,
        size: sizeItems,
      );

      if (orderResponse!.success) {
        orders.addAll(orderResponse!.result!.data);
        upcomingTask = orderResponse!.result!.data.firstWhereOrNull((order) {
          return order.status == 'pending';
        });
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

  Future<void> refreshOrderEmployee({bool isMoreUpcoming = false}) async {
    if (isMoreUpcoming) {
      pageItems = 1;
      orders = [];
    }
    await getOrderEmployee(isMoreUpcoming: isMoreUpcoming);
  }
}
