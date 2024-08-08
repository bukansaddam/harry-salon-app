import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/commodity.dart';
import 'package:image/image.dart' as img;
import 'package:tugas_akhir_app/model/commodity_history.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class CommodityProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  CommodityProvider({required this.authRepository, required this.apiService});

  XFile? _image;
  String? _imageUrl;

  XFile? get image => _image;
  String? get imageUrl => _imageUrl;

  CommodityResponse? commodityResponse;
  UploadResponse? uploadResponse;
  CommodityHistoryResponse? commodityHistoryResponse;

  LoadingState loadingState = const LoadingState.initial();
  LoadingState historyLoadingState = const LoadingState.initial();

  List<Commodity> commodities = [];
  List<CommodityHistory> commodityHistories = [];

  int? pageItems = 1;
  int sizeItems = 10;

  int? pageItemsHistory = 1;
  int sizeItemsHistory = 10;

  Future<void> getAllCommodity(
      {String? searchValue,
      required String storeId,
      String? category = ''}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token is null');
        notifyListeners();
        return;
      }

      if (category == 'All') category = '';

      commodityResponse = await apiService.getCommodity(
        token: token,
        storeId: storeId,
        name: searchValue!,
        category: category!,
      );

      if (commodityResponse!.success) {
        if (pageItems == 1) {
          commodities.clear();
        }
        commodities.addAll(commodityResponse!.result.data);

        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(commodityResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshCommodity({
    required String storeId,
    String searchValue = '',
    String category = '',
  }) async {
    pageItems = 1;
    commodities.clear();
    await getAllCommodity(
        storeId: storeId, searchValue: searchValue, category: category);
  }

  Future<void> createCommodity({
    required String storeId,
    required String name,
    required String stock,
    required String category,
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

      List<int> compressedImage = [];
      String filename = '';

      if (_image != null) {
        var bytes = await _image!.readAsBytes();
        compressedImage = await compressImage(bytes);
        filename = _image!.name;
      }

      uploadResponse = await apiService.createCommodity(
        token,
        compressedImage,
        filename,
        name,
        storeId,
        stock,
        category,
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

  Future<void> getCommodityHistory({required String storeId}) async {
    try {
      if (pageItemsHistory == 1) {
        historyLoadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        historyLoadingState = const LoadingState.error('Token is null');
        notifyListeners();
        return;
      }

      commodityHistoryResponse = await apiService.getCommodityHistory(
        token: token,
        storeId: storeId,
        page: pageItemsHistory!,
        size: sizeItemsHistory,
      );

      debugPrint('Api History Result Provider : $commodityHistoryResponse');

      if (commodityHistoryResponse != null &&
          commodityHistoryResponse!.success) {
        final results = commodityHistoryResponse!.data.data;

        if (pageItemsHistory == 1) {
          commodityHistories.clear();
        }

        commodityHistories.addAll(results);

        historyLoadingState = const LoadingState.loaded();

        debugPrint('Api History Result : ${results.length}');
        debugPrint('Api History Result : $commodityHistories');

        if (results.length < sizeItemsHistory) {
          pageItemsHistory = null;
        } else {
          pageItemsHistory = pageItemsHistory! + 1;
        }
      } else {
        historyLoadingState = LoadingState.error(
            commodityHistoryResponse?.message ?? 'Unknown error');
      }

      notifyListeners();
    } catch (e) {
      historyLoadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshCommodityHistory({required String storeId}) async {
    pageItemsHistory = 1;
    commodityHistories.clear();
    await getCommodityHistory(storeId: storeId);
  }

  Future<void> updateCommodity({
    required String id,
    required String name,
    required String stock,
    required String category,
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

      List<int> compressedImage = [];
      String filename = '';

      if (_image != null) {
        var bytes = await _image!.readAsBytes();
        compressedImage = await compressImage(bytes);
        filename = _image!.name;
      }

      uploadResponse = await apiService.updateCommodity(
          token: token,
          id: id,
          name: name,
          stock: stock,
          category: category,
          images: compressedImage,
          filenames: filename);

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

  Future<void> deleteCommodity({required String id}) async {
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

      uploadResponse = await apiService.deleteCommodity(
        token: token,
        id: id,
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
