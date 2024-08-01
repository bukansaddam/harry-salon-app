import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/common/loading_state.dart';
import 'package:tugas_akhir_app/data/api/api_service.dart';
import 'package:tugas_akhir_app/data/local/auth_repository.dart';
import 'package:tugas_akhir_app/model/review.dart';
import 'package:tugas_akhir_app/model/upload.dart';

class ReviewProvider extends ChangeNotifier {
  final AuthRepository authRepository;
  final ApiService apiService;

  ReviewProvider({
    required this.authRepository,
    required this.apiService,
  });

  LoadingState loadingState = const LoadingState.initial();

  ReviewResponse? reviewResponse;
  UploadResponse? uploadResponse;

  int? pageItems = 1;
  int sizeItems = 10;

  List<Review> reviews = [];

  double? averageRating = 0;
  int? totalReview = 0;
  int myRating = 0;

  Future<void> createReview({
    required String storeId,
    required String comment,
    required int rating,
  }) async {
    try {
      loadingState = const LoadingState.loading();
      notifyListeners();

      final repository = await authRepository.getUser();
      final token = repository?.token;
      uploadResponse = await apiService.createReview(
        token: token!,
        storeId: storeId,
        comment: comment,
        rating: rating.toString(),
      );

      if (reviewResponse == null) {
        loadingState = const LoadingState.error('Review not found');
        notifyListeners();
        return;
      }
      if (reviewResponse!.success) {
        loadingState = const LoadingState.loaded();
        notifyListeners();
      } else {
        loadingState = LoadingState.error(reviewResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> getAllReview(
      {required String storeId, String searchValue = ''}) async {
    try {
      if (pageItems == 1) {
        loadingState = const LoadingState.loading();
        notifyListeners();
      }

      final repository = await authRepository.getUser();
      final token = repository?.token;

      reviewResponse = await apiService.getAllReview(
          token: token!,
          storeId: storeId,
          page: pageItems!,
          size: sizeItems,
          rating: searchValue);

      if (reviewResponse == null) {
        loadingState = const LoadingState.error('Employee not found');
        notifyListeners();
        return;
      }

      if (reviewResponse!.success) {
        if (pageItems == 1) {
          reviews.clear();
        }
        reviews.addAll(reviewResponse!.result.data);

        loadingState = const LoadingState.loaded();
        totalReview = reviewResponse!.result.totalCount;
        myRating = reviews.map((e) => e.rating!).firstOrNull ?? 0;
        notifyListeners();
        calculateAverageRating();

        if (reviewResponse!.result.data.length < sizeItems) {
          pageItems = null;
        } else {
          pageItems = pageItems! + 1;
        }
      } else {
        loadingState = LoadingState.error(reviewResponse!.message);
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error(e.toString());
      notifyListeners();
    }
  }

  Future<void> refreshReview(
      {required String storeId, String searchValue = ''}) async {
    pageItems = 1;
    reviews.clear();
    totalReview = 0;
    averageRating = 0;
    await getAllReview(storeId: storeId, searchValue: searchValue);
  }

  void calculateAverageRating() {
    double totalRating = 0;
    for (var review in reviews) {
      totalRating += review.rating!;
    }

    averageRating = (totalRating ~/ reviews.length).toDouble();
    notifyListeners();
  }
}
