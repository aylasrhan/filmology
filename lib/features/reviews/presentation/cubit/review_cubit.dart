import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmology/core/di/service_locator.dart';
import 'package:filmology/core/services/auth_storage_service.dart';
import 'package:filmology/features/reviews/data/repositories/review_repository.dart';
import 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ReviewRepository _repository;
  final AuthStorageService _storageService = getIt<AuthStorageService>();

  String? currentUserEmail;

  ReviewCubit(this._repository) : super(ReviewInitial()) {
    loadCurrentUserEmail();
  }

  Future<void> loadCurrentUserEmail() async {
    currentUserEmail = await _storageService.getUserEmail();
  }

  Future<void> fetchReviews(int movieId) async {
    if (isClosed) return;

    await loadCurrentUserEmail();
    emit(ReviewLoading());
    try {
      final reviews = await _repository.getMovieReviews(movieId);
      if (isClosed) return;
      emit(ReviewSuccess(reviews));
    } catch (e) {
      if (!isClosed)
        emit(ReviewError("Failed to load reviews: ${e.toString()}"));
    }
  }

  Future<void> addReview({
    required int movieId,
    required double rating,
    required String comment,
  }) async {
    emit(SubmitReviewLoading());
    try {
      await _repository.submitReview(
        movieId: movieId,
        rating: rating,
        comment: comment,
      );

      if (!isClosed) emit(SubmitReviewSuccess());
    } catch (e) {
      if (!isClosed)
        emit(SubmitReviewError("Could not post review: ${e.toString()}"));
    }
  }

  Future<void> editReview({
    required int movieId,
    required int reviewId,
    required double rating,
    required String comment,
  }) async {
    emit(SubmitReviewLoading());

    try {
      await _repository.updateReview(
        movieId: movieId,
        reviewId: reviewId,
        rating: rating,
        comment: comment,
      );

      if (!isClosed) emit(EditReviewSuccess());
    } catch (e) {
      if (!isClosed) emit(SubmitReviewError("Update failed: ${e.toString()}"));
    }
  }

  Future<void> deleteReview({
    required int movieId,
    required int reviewId,
  }) async {
    if (state is ReviewSuccess) {
      final currentReviews = (state as ReviewSuccess).reviews;
      final updatedList = currentReviews
          .where((r) => r.id != reviewId)
          .toList();
      emit(ReviewSuccess(updatedList));
    }

    try {
      await _repository.deleteReview(movieId: movieId, reviewId: reviewId);
      await fetchReviews(movieId);
    } catch (e) {
      await fetchReviews(movieId);
      if (!isClosed)
        emit(ReviewError("Could not delete review: ${e.toString()}"));
    }
  }
}
