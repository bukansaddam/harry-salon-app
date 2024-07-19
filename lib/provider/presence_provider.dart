import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/presence.dart';
import 'package:tugas_akhir_app/model/qr_code.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class PresenceProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  PresenceProvider({
    required this.authRepository,
    required this.apiService,
  });

  QrCodeResponse? qrCodeResponse;
  UploadResponse? uploadResponse;
  PresenceResponse? presenceResponse;

  LoadingState loadingState = const LoadingState.initial();

  int? pageItems = 1;
  int sizeItems = 10;

  List<Presence> presences = [];

  Future<void> getQrCode({required String storeId}) async {
    try {
      final repository = await authRepository.getUser();
      final token = repository?.token;

      qrCodeResponse =
          await apiService.getQrCode(storeId: storeId, token: token!);

      if (qrCodeResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(qrCodeResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<bool> createPresence({required String code}) async {
    try {
      final repository = await authRepository.getUser();
      final token = repository?.token;

      uploadResponse =
          await apiService.createPresence(code: code, token: token!);

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

  Future<void> getAttendance() async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      presenceResponse = await apiService.getAttendace(
        token: token!,
        page: pageItems!,
        size: sizeItems,
      );

      if (presenceResponse!.success) {
        presences.addAll(presenceResponse!.result.data);
        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (presenceResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(presenceResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshAttendance() async {
    pageItems = 1;
    presences.clear();
    getAttendance();
  }
}
