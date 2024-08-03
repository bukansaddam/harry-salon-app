import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_payslip.dart';

class DetailPayslipProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;
  final String id;

  DetailPayslipProvider({
    required this.apiService,
    required this.authRepository,
    required this.id,
  }) {
    getDetailPayslip(id);
  }

  DetailPayslipResponse? detailPayslipResponse;

  LoadingState loadingState = const LoadingState.initial();

  List<SubDetailPayslip> earnings = [];
  List<SubDetailPayslip> deductions = [];

  int totalEarning = 0;
  int totalDeduction = 0;

  Future<void> getDetailPayslip(String id) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token is null');
        notifyListeners();
        return;
      }

      detailPayslipResponse = await apiService.getDetailPayslip(
        token: token,
        id: id,
      );

      if (detailPayslipResponse!.success) {
        earnings.addAll(detailPayslipResponse!.data.earnings);
        if (detailPayslipResponse!.data.deductions != null) {
          deductions.addAll(detailPayslipResponse!.data.deductions!);
        }

        calculateTotal();

        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(detailPayslipResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error: $e');
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  void calculateTotal() {
    totalEarning = detailPayslipResponse!.data.earnings
        .map((e) => e.amount ?? 0)
        .fold(0, (value, element) => value + element);

    totalDeduction = detailPayslipResponse!.data.deductions != null &&
            detailPayslipResponse!.data.deductions!.isNotEmpty
        ? detailPayslipResponse!.data.deductions!
            .map((e) => e.amount ?? 0)
            .fold(0, (value, element) => value + element)
        : 0;

    notifyListeners();
  }
}
