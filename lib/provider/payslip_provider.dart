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

  List<XFile> _images = [];
  List<String> _imageUrls = [];

  List<XFile> get images => _images;
  List<String> get imageUrls => _imageUrls;

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
      totalEarning += earning.amount;
    }

    for (var deduction in deductions) {
      totalDeduction += deduction.amount;
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
    List<SubDetailPayslip> earnings,
    List<SubDetailPayslip> deductions,
  ) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      List<List<int>> compressedImages = [];
      List<String> filenames = [];

      for (var image in _images) {
        var bytes = await image.readAsBytes();
        var compressedBytes = await compressImage(bytes);
        var filename = image.name;
        filenames.add(filename);
        compressedImages.add(compressedBytes);
      }

      uploadResponse = await apiService.createPayslip(
        token!,
        compressedImages,
        filenames,
        name,
        employeeId,
        total,
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

  void setImages(List<XFile> images) {
    _images = images;
    _imageUrls = images.map((e) => e.path).toList();
    notifyListeners();
  }

  void addImage(XFile image) {
    _images.add(image);
    _imageUrls.add(image.path);
    notifyListeners();
  }

  void addImages(List<XFile> newImages) {
    _images.addAll(newImages);
    _imageUrls.addAll(newImages.map((e) => e.path));
    notifyListeners();
  }

  void removeImage(int index) {
    _images.removeAt(index);
    _imageUrls.removeAt(index);
    notifyListeners();
  }

  void clearImage() {
    _images = [];
    _imageUrls = [];
  }
}
