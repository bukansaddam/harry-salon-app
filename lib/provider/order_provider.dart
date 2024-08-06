import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/common/order_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/order.dart';
import 'package:tugas_akhir_app/model/queue.dart';
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
  QueueResponse? queueResponse;

  LoadingState loadingState = const LoadingState.initial();
  LoadingState currentOrderLoadingState = const LoadingState.initial();
  OrderState orderState = const OrderState.initial();
  LoadingState queueLoadingState = const LoadingState.initial();

  List<Order> orders = [];
  Order? upcomingTask;
  Order? currentTask;
  Order? currentTaskCustomer;
  Queue? queue;

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
        currentTaskCustomer = orderResponse!.result!.data.firstWhereOrNull(
            (order) =>
                order.isMe == true &&
                order.status != "done" &&
                order.status != "cancel");

        currentTaskCustomer ??= null;

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

  Future<void> getQueue({String? storeId}) async {
    try {
      queueLoadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        queueLoadingState = const LoadingState.error('You are not logged in');
        notifyListeners();
        return;
      }

      queueResponse =
          await apiService.getQueue(token: token, storeId: storeId!);

      if (queueResponse != null && queueResponse!.success) {
        queue = queueResponse!.result;
        queueLoadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        queueLoadingState =
            LoadingState.error(queueResponse?.message ?? "Unknown error");
        notifyListeners();
      }
    } catch (e) {
      queueLoadingState = LoadingState.error(e.toString());
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

      orderResponse = await apiService.getOrderEmployee(
        token: token,
        page: pageItems,
        size: sizeItems,
      );

      if (orderResponse!.success) {
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

  Future<void> getMoreOrderEmployee() async {
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

      orderResponse = await apiService.getOrderEmployee(
        token: token,
        page: pageItems,
        size: sizeItems,
      );

      if (orderResponse!.success) {
        orders.addAll(orderResponse!.result!.data
            .where((order) => order.status == 'pending'));
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

  Future<void> refreshOrderEmployee() async {
    pageItems = 1;
    orders = [];
    await getMoreOrderEmployee();
  }

  Future<void> getCurrentOrderEmployee() async {
    try {
      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        currentOrderLoadingState =
            const LoadingState.error('You are not logged in');
        notifyListeners();
        return;
      }

      orderResponse = await apiService.getOrderEmployee(
        token: token,
        page: pageItems,
        size: sizeItems,
      );

      if (orderResponse!.success) {
        currentTask = orderResponse!.result!.data
            .lastWhereOrNull((order) => order.isMe == true);
        _checkOrderState(currentTask!.status);
        currentOrderLoadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        currentOrderLoadingState = LoadingState.error(orderResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      currentOrderLoadingState = LoadingState.error(e.toString());
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
    } else if (status == 'cancel') {
      orderState = const OrderState.canceled();
      notifyListeners();
    } else if (status == 'unpaid') {
      orderState = const OrderState.unpaid();
      notifyListeners();
    }
  }
}
