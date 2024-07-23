import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/detail_store.dart';
import 'package:tugas_akhir_app/model/store.dart';
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
  StoreResponse? storeResponse;

  int? pageItems = 1;
  int sizeItems = 10;

  List<Store> stores = [];
  List<Store> storesCustomer = [];
  List<String> deletedImages = [];
  List<Map<String, dynamic>> existingImages = [];
  List<Map<String, dynamic>> combinedImages = [];

  int _activeStoreCount = 0;
  int get activeStoreCount => _activeStoreCount;

  bool? isActive = true;

  Future<void> getAllStore({
    String searchValue = '',
  }) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      storeResponse = await apiService.getAllStore(
        name: searchValue,
        token: token!,
        page: pageItems!,
        size: sizeItems,
      );

      if (storeResponse!.success) {
        storesCustomer.addAll(storeResponse!.result.data
            .where((store) => store.isActive == true));

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (storeResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(storeResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshStore({
    String searchValue = '',
  }) async {
    pageItems = 1;
    storesCustomer.clear();
    await getAllStore(searchValue: searchValue);
  }

  Future<void> getAllOwnerStore({String searchValue = ''}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      storeResponse = await apiService.getAllOwnerStore(
          token: token!, page: pageItems!, size: sizeItems, name: searchValue);

      if (storeResponse!.success) {
        stores.addAll(storeResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();

        if (storeResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(storeResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> getTotalActiveStore() async {
    _activeStoreCount = stores.where((store) => store.isActive).length;
  }

  Future<void> refreshOwnerStore({String searchValue = ''}) async {
    pageItems = 1;
    stores.clear();
    await getAllOwnerStore(searchValue: searchValue);
    await getTotalActiveStore();
  }

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

  Future<void> updateStore({
    required String id,
    required String name,
    required String description,
    required String location,
    required double latitude,
    required double longitude,
    required TimeOfDay openAt,
    required TimeOfDay closeAt,
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

      uploadResponse = await apiService.updateStore(
          token: token!,
          id: id,
          images: compressedImages,
          filenames: filenames,
          name: name,
          description: description,
          location: location,
          latitude: latitude,
          longitude: longitude,
          openAt: openAt,
          closeAt: closeAt,
          deletedImages: deletedImages);

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
      debugPrint(e.toString());
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
    combineImages();
    notifyListeners();
  }

  void clearImage() {
    _images = [];
    _imageUrls = [];
    deletedImages = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void addExistingImage(DetailStore detailStore) {
    existingImages = detailStore.images
        .map((image) => {
              'isProvider': false,
              'url': image.image.toString().contains('http')
                  ? image.image
                  : '${ApiService.baseUrl}/${image.image}',
              'id': image.id
            })
        .toList();
    notifyListeners();
  }

  void combineImages() {
    combinedImages = [
      ...existingImages,
      ..._imageUrls.map(
        (url) => {'isProvider': true, 'url': url},
      ),
    ];
    notifyListeners();
    debugPrint(combinedImages.toString());
  }

  void deleteExistingImage(String id) {
    existingImages.removeWhere((image) => image['id'] == id);
    deletedImages.add(id);
    notifyListeners();
  }
}
