import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/payslip.dart';

class PayslipProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  PayslipProvider({
    required this.authRepository,
    required this.apiService,
  });

  PayslipResponse? payslipResponse;

  LoadingState loadingState = const LoadingState.initial();

  int? pageItems = 1;
  int sizeItems = 10;

  List<Payslip> payslips = [];

  Future<void> getAllPayslip({String? searchValue}) async {
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

      payslipResponse = await apiService.getPayslip(
        token: token,
        page: pageItems!,
        size: sizeItems,
        name: searchValue ?? '',
      );

      if (payslipResponse == null) {
        loadingState = const LoadingState.error('Payslip not found');
        notifyListeners();
        return;
      }

      if (payslipResponse!.success) {
        if (pageItems == 1) {
          payslips.clear();
        }
        payslips.addAll(payslipResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (payslipResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(payslipResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshPayslip({String? searchValue}) async {
    pageItems = 1;
    payslips.clear();
    await getAllPayslip(searchValue: searchValue);
  }
}
