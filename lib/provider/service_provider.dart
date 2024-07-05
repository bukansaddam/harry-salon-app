import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:image/image.dart' as img;
import 'package:tugas_akhir_app/model/service.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class ServiceProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  ServiceProvider({
    required this.authRepository,
    required this.apiService,
  });

  XFile? _image;
  String? _imageUrl;

  XFile? get image => _image;
  String? get imageUrl => _imageUrl;

  ServiceResponse? serviceResponse;
  UploadResponse? uploadResponse;

  LoadingState loadingState = const LoadingState.initial();

  int? pageItems = 1;
  int sizeItems = 10;

  List<Service> services = [];

  Future<void> getAllService(
      {required String storeId, required String searchValue}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      serviceResponse = await apiService.getAllService(
        token: token!,
        storeId: storeId,
        page: pageItems!,
        size: sizeItems,
        name: searchValue,
      );

      if (serviceResponse!.success) {
        if (pageItems == 1) {
          services.clear();
        }
        services.addAll(serviceResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (serviceResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(serviceResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshService(
      {required String storeId, String searchValue = ''}) async {
    pageItems = 1;
    services.clear();
    await getAllService(storeId: storeId, searchValue: searchValue);
  }

  Future<void> createService({
    required String storeId,
    required String name,
    required String price,
    required String duration,
  }) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      List<int> compressedImage = [];
      String filename = '';

      if (_image != null) {
        var bytes = await _image!.readAsBytes();
        compressedImage = await compressImage(bytes);
        filename = _image!.name;
      }

      uploadResponse = await apiService.createService(
        token!,
        compressedImage,
        filename,
        name,
        price,
        duration,
        storeId,
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
}
