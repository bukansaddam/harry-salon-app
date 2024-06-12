import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_user.dart';
import 'package:tugas_akhir_app/model/upload.dart';
import 'package:image/image.dart' as img;

class UserProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  UserProvider({
    required this.authRepository,
    required this.apiService,
  }) {
    getDetailUser();
  }

  XFile? _image;
  String? _imageUrl;

  XFile? get image => _image;
  String? get imageUrl => _imageUrl;

  LoadingState loadingState = const LoadingState.initial();

  DetailUserResponse? userDetailResponse;
  UploadResponse? uploadResponse;

  Future<void> getDetailUser() async {
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

      userDetailResponse = await apiService.getDetailUser(token: token);

      if (userDetailResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(userDetailResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> updateImageProfile({
    required List<int> images,
    required String filename,
  }) async {
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

      uploadResponse = await apiService.updateImageProfile(
        token: token,
        images: images,
        filename: filename,
      );

      if (uploadResponse!.success) {
        await getDetailUser();
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

  Future<void> updateProfile({
    required String data,
    required String title,
  }) async {
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

      String? name;
      String? email;
      String? address;
      String? phoneNumber;

      if (title == 'Full Name') {
        name = data;
      } else if (title == 'Email') {
        email = data;
      } else if (title == 'Address') {
        address = data;
      } else if (title == 'Phone') {
        phoneNumber = data;
      }

      uploadResponse = await apiService.updateProfile(
        token: token,
        name: name,
        email: email,
        address: address,
        phoneNumber: phoneNumber,
      );

      if (uploadResponse!.success) {
        await getDetailUser();
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
      newByte = img.encodeJpg(image, quality: compressQuality);
      length = newByte.length;
    } while (length > 1000000);

    return newByte;
  }

  void setImage(XFile image) async {
    _image = image;
    _imageUrl = image.path;
    notifyListeners();

    var bytes = await image.readAsBytes();
    List<int> compressedImage = await compressImage(bytes);
    await updateImageProfile(
      images: compressedImage,
      filename: image.name,
    );
  }

  void clearImage() {
    _image = null;
    _imageUrl = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
