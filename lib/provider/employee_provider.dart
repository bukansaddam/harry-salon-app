import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/employee.dart';

class EmployeeProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  EmployeeProvider({required this.apiService, required this.authRepository});

  LoadingState loadingState = const LoadingState.initial();

  EmployeeResponse? employeeResponse;

  int? pageItems = 1;
  int sizeItems = 10;

  List<Employee> employees = [];

  Future<void> getAllEmployee(String searchValue) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token not found');
        notifyListeners();
        return;
      }

      if (pageItems == null) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
        return;
      }

      employeeResponse = await apiService.getAllEmployee(
          token: token, page: pageItems!, size: sizeItems, name: searchValue);

      if (employeeResponse == null) {
        loadingState = const LoadingState.error('Employee not found');
        notifyListeners();
        return;
      }

      if (employeeResponse!.success) {
        if (pageItems == 1) {
          employees.clear();
        }
        employees.addAll(employeeResponse!.result.data);
        debugPrint(employees.toString());

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (employeeResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(employeeResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      debugPrint(e.toString());
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshEmployee(String searchValue) async {
    loadingState = const LoadingState.loading();
    pageItems = 1;
    employees.clear();
    await getAllEmployee(searchValue);
  }
}
