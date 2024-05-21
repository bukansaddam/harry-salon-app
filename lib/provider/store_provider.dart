import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/upload.dart';
import 'package:image/image.dart' as img;

class StoreProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  StoreProvider({required this.apiService, required this.authRepository});

  List<XFile> _images = [];
  List<String> _imageUrls = [];

  List<XFile> get images => _images;
  List<String> get imageUrls => _imageUrls;

  LoadingState loadingState = const LoadingState.initial();

  String? _message;
  String? get message => _message;

  UploadResponse? uploadResponse;

  Future<void> addStore(
    String name,
    String description,
    String location,
    double latitude,
    double longitude,
    TimeOfDay openAt,
    TimeOfDay closeAt,
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

      uploadResponse = await apiService.addStore(
        token!,
        compressedImages,
        filenames,
        name,
        description,
        location,
        latitude,
        longitude,
        openAt,
        closeAt,
      );

      if (uploadResponse!.success) {
        loadingState = const LoadingState.loaded();
        _message = uploadResponse!.message;
        notifyListeners();
      } else {
        _message = uploadResponse!.message;
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
