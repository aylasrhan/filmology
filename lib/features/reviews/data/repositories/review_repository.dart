import 'package:filmology/core/network/api_constans.dart';
import 'package:filmology/core/network/api_consumer.dart';
import 'package:filmology/features/reviews/data/models/review_model.dart';

class ReviewRepository {
  final ApiConsumer _api;
  ReviewRepository(this._api);
  Future<List<ReviewModel>> getMovieReviews(int movieId) async {
    try {
      final response = await _api.get(EndPoints.movieReviews(movieId));

      if (response is List && response.isNotEmpty) {
        final firstElement = response[0];

        if (firstElement is Map<String, dynamic> &&
            firstElement.containsKey('data')) {
          final List reviewsData = firstElement['data'];
          return reviewsData.map((json) => ReviewModel.fromJson(json)).toList();
        }
      }
      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final List reviewsData = response['data'];
        return reviewsData.map((json) => ReviewModel.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      throw Exception("Error fetching reviews: $e");
    }
  }
  Future<void> submitReview({
    required int movieId,
    required double rating,
    required String comment,
  }) async {
    try {
      await _api.post(
        "movies/$movieId/reviews",
        data: {"rating": rating, "comment": comment},
      );
    } catch (e) {
      throw Exception("Failed to submit review: $e");
    }
  }
  Future<void> updateReview({
    required int movieId,
    required int reviewId,
    required double rating,
    required String comment,
  }) async {
    try {
      await _api.update(
        "movies/$movieId/reviews/$reviewId",
        data: {"rating": rating, "comment": comment},
      );
    } catch (e) {
      throw Exception("Failed to update review: $e");
    }
  }
  Future<void> deleteReview({
    required int movieId,
    required int reviewId,
  }) async {
    try {
      await _api.delete("movies/$movieId/reviews/$reviewId");
    } catch (e) {
      throw Exception("Failed to delete review: $e");
    }
  }
}
