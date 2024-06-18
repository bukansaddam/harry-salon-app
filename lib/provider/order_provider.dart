import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider({
    required this.apiService,
    required this.authRepository,
  });

  final ApiService apiService;
  final AuthRepository authRepository;

  LoadingState? loadingState = const LoadingState.initial();
}
