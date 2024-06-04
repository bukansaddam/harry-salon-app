import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/service.dart';

class ServiceProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  ServiceProvider({
    required this.authRepository,
    required this.apiService,
  });

  ServiceResponse? serviceResponse;

  LoadingState loadingState = const LoadingState.initial();

  int? pageItems = 1;
  int sizeItems = 10;

  List<Service> services = [];

  Future<void> getAllService(
      {required String storeId, required String searchValue}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      serviceResponse = await apiService.getAllService(
        token: token!,
        storeId: storeId,
        page: pageItems!,
        size: sizeItems,
      );

      if (serviceResponse!.success) {
        if (pageItems == 1) {
          services.clear();
        }
        services.addAll(serviceResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (serviceResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(serviceResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshService(
      {required String storeId, String searchValue = ''}) async {
    pageItems = 1;
    services.clear();
    await getAllService(storeId: storeId, searchValue: searchValue);
  }
}
