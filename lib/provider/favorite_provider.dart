import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/favorite.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class FavoriteProvider extends ChangeNotifier {
  final ApiService apiService;
  final AuthRepository authRepository;

  FavoriteProvider({
    required this.apiService,
    required this.authRepository,
  });

  FavoriteResponse? favoriteResponse;
  UploadResponse? uploadResponse;

  LoadingState loadingState = const LoadingState.initial();

  int? pageItems = 1;
  int? sizeItems = 10;

  List<Favorite> favorites = [];
  bool isFavorite = false;

  Future<void> addToFavorite(String id) async {
    try {
      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token not found');
        notifyListeners();
        return;
      }

      uploadResponse = await apiService.createFavorite(
        token: token,
        hairstyleId: id,
      );

      if (uploadResponse!.success) {
        await getFavorite(id: id);
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

  Future<void> removeFromFavorite(String id) async {
    try {
      final repository = await authRepository.getUser();
      final token = repository?.token;

      if (token == null) {
        loadingState = const LoadingState.error('Token not found');
        notifyListeners();
        return;
      }

      final favoriteId = favorites
          .where((element) => element.hairstyleId == id)
          .map((e) => e.id)
          .first;

      uploadResponse = await apiService.deleteFavorite(
        token: token,
        id: favoriteId,
      );

      if (uploadResponse!.success) {
        await getFavorite(id: id);
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

  Future<void> getFavorite({String searchValue = '', String? id}) async {
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

      favoriteResponse = await apiService.getFavorite(
        token: token,
        page: pageItems!,
        size: sizeItems!,
        name: searchValue,
      );

      if (favoriteResponse!.success) {
        favorites = favoriteResponse!.result.data;
        if (id != null) await checkFavorite(id);
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(favoriteResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshFavorite({String searchValue = ''}) async {
    pageItems = 1;
    if (favorites is! UnmodifiableListView) {
      favorites.clear();
    } else {
      favorites = [];
    }
    await getFavorite(searchValue: searchValue);
  }

  Future<void> checkFavorite(String id) async {
    final index =
        favorites.indexWhere((favorite) => favorite.hairstyleId == id);
    isFavorite = index != -1;
    notifyListeners();
  }
}
