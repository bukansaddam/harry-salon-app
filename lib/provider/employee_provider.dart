import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/employee.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class EmployeeProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  EmployeeProvider({required this.apiService, required this.authRepository});

  LoadingState loadingState = const LoadingState.initial();
  LoadingState employeeLoadingState = const LoadingState.initial();

  EmployeeResponse? employeeResponse;
  UploadResponse? uploadResponse;

  int? pageItems = 1;
  int sizeItems = 10;

  List<Employee> employees = [];
  List<Employee> employeesByStore = [];

  Future<void> getAllEmployee({String? searchValue}) async {
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

      employeeResponse = await apiService.getAllEmployee(
        token: token,
        page: pageItems!,
        size: sizeItems,
        name: searchValue ?? '',
      );

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
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshEmployee({String? searchValue}) async {
    pageItems = 1;
    employees.clear();
    await getAllEmployee(searchValue: searchValue);
  }

  Future<void> getEmployeeByStore(String storeId, {String? searchValue}) async {
    try {
      if (pageItems == 1) {
        employeeLoadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        employeeLoadingState = const LoadingState.error('Token not found');
        notifyListeners();
        return;
      }

      employeeResponse = await apiService.getEmployeeByStore(
        token: token,
        storeId: storeId,
        page: pageItems!,
        size: sizeItems,
        name: searchValue ?? '',
      );

      if (employeeResponse == null) {
        employeeLoadingState = const LoadingState.error('Employee not found');
        notifyListeners();
        return;
      }

      if (employeeResponse!.success) {
        if (pageItems == 1) {
          employeesByStore.clear();
        }
        employeesByStore.addAll(employeeResponse!.result.data);

        employeeLoadingState = const LoadingState.loaded();
        notifyListeners();

        if (employeeResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        employeeLoadingState = LoadingState.error(employeeResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      employeeLoadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshEmployeeByStore(String storeId,
      {String? searchValue}) async {
    pageItems = 1;
    employeesByStore.clear();
    await getEmployeeByStore(storeId, searchValue: searchValue);
  }

  Future<void> createEmployee(
    String name,
    String address,
    String storeId,
    String phoneNumber,
    String email,
    String password,
  ) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token not found');
        notifyListeners();
        return;
      }

      uploadResponse = await apiService.createEmployee(
        token,
        name,
        address,
        storeId,
        phoneNumber,
        email,
        password,
      );

      if (uploadResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(uploadResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }
}
