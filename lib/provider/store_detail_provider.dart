import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';
import 'package:tugas_akhir_app/model/employee.dart';

class StoreDetailProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;
  final String id;

  StoreDetailProvider({
    required this.authRepository,
    required this.apiService,
    required this.id,
  }) {
    getAllEmployeeByStore(id);
    getDetailStore(id);
  }

  DetailStoreResponse? detailStoreResponse;
  EmployeeResponse? employeeResponse;

  LoadingState loadingState = const LoadingState.initial();
  LoadingState employeeLoadingState = const LoadingState.initial();

  String? _message;
  String? get message => _message;

  List<Employee> employees = [];

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

  Future<void> getAllEmployeeByStore(String id) async {
    try {
      employeeLoadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        employeeLoadingState = const LoadingState.error('Token not found');
        notifyListeners();
        return;
      }

      employeeResponse = await apiService.getAllEmployee(token: token);

      if (employeeResponse == null) {
        employeeLoadingState = const LoadingState.error('Employee not found');
        notifyListeners();
        return;
      }

      if (employeeResponse!.success) {
        final filteredEmployees = employeeResponse!.result.data
            .where((employee) => employee.storeId == id)
            .toList();

        employees.clear();
        employees.addAll(filteredEmployees);

        employeeLoadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        employeeLoadingState = LoadingState.error(employeeResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      employeeLoadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }
}
