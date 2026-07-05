import 'package:filmology/features/home/data/models/movie_model.dart';

abstract class HomeRepository {
  Future<List<MovieModel>> getAllMovies();
  
}
