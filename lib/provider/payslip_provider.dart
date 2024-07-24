import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_payslip.dart';
import 'package:tugas_akhir_app/model/payslip.dart';
import 'package:image/image.dart' as img;
import 'package:tugas_akhir_app/model/upload.dart';

class PayslipProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  PayslipProvider({
    required this.authRepository,
    required this.apiService,
  });

  XFile? _image;
  String? _imageUrl;

  XFile? get image => _image;
  String? get imageUrl => _imageUrl;

  PayslipResponse? payslipResponse;
  UploadResponse? uploadResponse;

  LoadingState loadingState = const LoadingState.initial();

  int? pageItems = 1;
  int sizeItems = 10;

  List<Payslip> payslips = [];
  List<SubDetailPayslip> earnings = [];
  List<SubDetailPayslip> deductions = [];

  int totalEarning = 0;
  int totalDeduction = 0;
  int totalPayslip = 0;

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

  Future<void> addEarning(String name, int amount) async {
    earnings.add(
      SubDetailPayslip(
        name: name,
        amount: amount,
      ),
    );

    await getTotalPayslip();

    notifyListeners();
  }

  Future<void> addDeduction(String name, int amount) async {
    deductions.add(
      SubDetailPayslip(
        name: name,
        amount: amount,
      ),
    );

    await getTotalPayslip();

    notifyListeners();
  }

  Future<void> getTotalPayslip() async {
    totalEarning = 0;
    totalDeduction = 0;

    for (var earning in earnings) {
      totalEarning += earning.amount!;
    }

    for (var deduction in deductions) {
      totalDeduction += deduction.amount!;
    }

    totalPayslip = totalEarning - totalDeduction;

    notifyListeners();
  }

  Future<void> removeEarning(int index) async {
    earnings.removeAt(index);
    await getTotalPayslip();
  }

  Future<void> removeDeduction(int index) async {
    deductions.removeAt(index);
    await getTotalPayslip();
  }

  Future<void> clearSubDetail() async {
    earnings.clear();
    deductions.clear();
  }

  Future<void> createPayslip(
    String name,
    String employeeId,
    int total,
    DateTime date,
    List<SubDetailPayslip> earnings,
    List<SubDetailPayslip> deductions,
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

      List<int> compressedImage = [];
      String filename = '';

      if (_image != null) {
        var bytes = await _image!.readAsBytes();
        compressedImage = await compressImage(bytes);
        filename = _image!.name;
      }

      uploadResponse = await apiService.createPayslip(
        token,
        compressedImage,
        filename,
        name,
        employeeId,
        total,
        date,
        earnings,
        deductions,
      );

      if (uploadResponse == null) {
        loadingState = const LoadingState.error('Create payslip failed');
        notifyListeners();
        return;
      }

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

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];

    do {
      compressQuality -= 10;

      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );

      length = newByte.length;
    } while (length > 1000000);

    return newByte;
  }

  void setImage(XFile image) {
    _image = image;
    _imageUrl = image.path;
    notifyListeners();
  }

  void clearImage() {
    _image = null;
    _imageUrl = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void clearPayslip() {
    _image = null;
    _imageUrl = null;
    earnings.clear();
    deductions.clear();
    totalEarning = 0;
    totalDeduction = 0;
    totalPayslip = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  Future<void> getPayslipEmployeeByOwner(
      {String? searchValue, required String employeeId}) async {
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

      payslipResponse = await apiService.getPayslipEmployeeByOwner(
        token: token,
        employeeId: employeeId,
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

  Future<void> refreshPayslipEmployeeByOwner(
      {String? searchValue, required String employeeId}) async {
    pageItems = 1;
    payslips.clear();
    await getPayslipEmployeeByOwner(
        searchValue: searchValue, employeeId: employeeId);
  }
}
