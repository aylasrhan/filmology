import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import '../../domain/repository/home_repository.dart';
import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository;
  List<MovieModel> _allMovies = []; 

  HomeCubit(this.homeRepository) : super(HomeInitial());

  Future<void> fetchAllMovies() async {
    emit(HomeLoading());
    try {
      _allMovies = await homeRepository.getAllMovies();
      emit(HomeSuccess(_allMovies)); 
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void filterMovies(String category) {
  if (category == "All") {
    emit(HomeSuccess(_allMovies));
  } else {
    Map<String, int> categoryIds = {
      "Action": 1, 
      "Sci-Fi": 1, 
      "Comedy": 3,
      "Drama": 4,
      "Horror": 5,
    };

    int? targetId = categoryIds[category];

    final filtered = _allMovies.where((movie) {
      return movie.genreId == targetId; 
    }).toList();

    emit(HomeSuccess(filtered));
  }
}
void searchMovies(String query) {
  if (query.isEmpty) {
    emit(HomeSuccess(_allMovies));
  } else {
    final results = _allMovies
        .where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(HomeSuccess(results));
  }
}

}