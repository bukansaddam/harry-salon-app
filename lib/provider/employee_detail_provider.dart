import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_employee.dart';

class EmployeeDetailProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;
  final String id;

  EmployeeDetailProvider(
      {required this.authRepository,
      required this.apiService,
      required this.id}) {
    getDetailEmployee(id);
  }

  LoadingState loadingState = const LoadingState.initial();

  DetailEmployeeResponse? detailEmployeeResponse;

  Future<void> getDetailEmployee(String id) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      detailEmployeeResponse =
          await apiService.getDetailEmployee(token: token!, id: id);

      if (detailEmployeeResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(detailEmployeeResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }
}
