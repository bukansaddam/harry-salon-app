import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';
import 'package:image/image.dart' as img;
import 'package:tugas_akhir_app/model/upload.dart';

class HairstyleProvider extends ChangeNotifier {
  ApiService apiService;
  AuthRepository authRepository;

  HairstyleProvider({required this.apiService, required this.authRepository});

  List<XFile> _images = [];
  List<String> _imageUrls = [];

  List<XFile> get images => _images;
  List<String> get imageUrls => _imageUrls;

  LoadingState loadingState = const LoadingState.initial();

  HairstyleResponse? hairstyleResponse;
  UploadResponse? uploadResponse;

  List<Hairstyle> hairstyles = [];

  int? pageItems = 1;
  int sizeItems = 10;

  Future<void> getAllHairstyle({String? searchValue}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      hairstyleResponse = await apiService.getAllHairstyle(
        page: pageItems!,
        size: sizeItems,
        name: searchValue ?? '',
      );

      if (hairstyleResponse == null) {
        loadingState = const LoadingState.error('Payslip not found');
        notifyListeners();
        return;
      }

      if (hairstyleResponse!.success) {
        if (pageItems == 1) {
          hairstyles.clear();
        }
        hairstyles.addAll(hairstyleResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (hairstyleResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(hairstyleResponse!.message);
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
    }
  }

  Future<void> refreshHairstyle({String? searchValue}) async {
    pageItems = 1;
    hairstyles.clear();
    await getAllHairstyle(searchValue: searchValue);
  }

  Future<void> addHairstyle({
    required String name,
    required String description,
  }) async {
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

      uploadResponse = await apiService.addHairstyle(
        token!,
        name,
        description,
        compressedImages,
        filenames,
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

  Future<void> deleteHairstyle(String id) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('You must login first');
        notifyListeners();
        return;
      }

      final response = await apiService.deleteHairstyle(token: token, id: id);

      if (response.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(response.message);
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
