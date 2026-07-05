import 'package:filmology/core/network/api_service.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/home/domain/repository/home_repository.dart';
import 'package:filmology/features/reviews/data/models/review_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService apiService;

  HomeRepositoryImpl(this.apiService);

  @override
  Future<List<MovieModel>> getAllMovies() async {
    return await apiService.getMovies();
  }

  Future<List<ReviewModel>> getMovieReviews(int movieId) async {
    return await apiService.getMovieReviews(movieId);
  }

  Future<void> addReview(int movieId, int rating, String comment) async {
    return await apiService.addReview(movieId, rating, comment);
  }
}
