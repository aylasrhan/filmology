
import 'package:filmology/core/network/api_constans.dart';
import 'package:filmology/core/network/api_consumer.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/reviews/data/models/review_model.dart'; // تأكدي من إنشاء هذا الملف

class HomeApiService {
  final ApiConsumer _api;

  HomeApiService(this._api);

  Future<List<MovieModel>> getMovies() async {
    final response = await _api.get(EndPoints.allMovies);

    if (response is List && response.isNotEmpty) {
      final Map<String, dynamic> firstElement = response[0];
      final List<dynamic> moviesJson = firstElement['data'];

      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    } else if (response is Map<String, dynamic>) {
      final List<dynamic> moviesJson = response['data'];
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    }

    return [];
  }

  Future<List<ReviewModel>> getMovieReviews(int movieId) async {
    final response = await _api.get("movies/$movieId/reviews");

    if (response is List && response.isNotEmpty) {
      final Map<String, dynamic> firstElement = response[0];
      final List<dynamic> reviewsJson = firstElement['data'];

      return reviewsJson.map((json) => ReviewModel.fromJson(json)).toList();
    } else if (response is Map<String, dynamic>) {
      final List<dynamic> reviewsJson = response['data'];
      return reviewsJson.map((json) => ReviewModel.fromJson(json)).toList();
    }

    return [];
  }
 
  Future<void> addReview(int movieId, int rating, String comment) async {
    try {
     
      await _api.post(
        "movies/$movieId/reviews",
        data: {
          "rating": rating,
          "comment": comment,
        },
      );
    } catch (e) {
      throw Exception("حدث خطأ أثناء إرسال المراجعة: ${e.toString()}");
    }
  }
}