class MovieModel {
  final int id;
  final String title;
  final int year;
  final String posterUrl;
  final String description;
  final String? trailerUrl;
  final String ageRating;
  final String genreName;
  final int genreId;
  final double rating;

  MovieModel({
    required this.id,
    required this.title,
    required this.year,
    required this.posterUrl,
    required this.description,
    this.trailerUrl,
    required this.ageRating,
    required this.genreName,
    required this.rating,
      required this.genreId,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    double rawRating = double.tryParse((json['rating'] ?? 0.0).toString()) ?? 0.0;
    
    String rawPoster = json['poster_url']?.toString() ?? '';
    String finalPosterUrl = 'https://via.placeholder.com/500x750?text=No+Image';

    if (rawPoster.isNotEmpty) {
      if (rawPoster.startsWith('http')) {
        finalPosterUrl = rawPoster;
      } else {
        finalPosterUrl = "https://movie-platform.focal-x.com${rawPoster.startsWith('/') ? '' : '/'}$rawPoster";
      }
    }

    return MovieModel(
      id: int.parse(json['id'].toString()),
      title: json['title'] ?? 'No Title',
      year: int.tryParse(json['year'].toString()) ?? 0,
      posterUrl: finalPosterUrl,
      description: json['description'] ?? 'No Description available.',
      trailerUrl: json['trailer_url'],
      ageRating: json['age_rating'] ?? 'PG',
      genreName: json['genre_name'] ?? 'General',
      rating: rawRating,
      genreId: int.tryParse(json['genre_id'].toString()) ?? 0,
    );
  }

  MovieModel copyWith({double? rating}) {
    return MovieModel(
      id: id,
      title: title,
      year: year,
      posterUrl: posterUrl,
      description: description,
      trailerUrl: trailerUrl,
      ageRating: ageRating,
      genreName: genreName,
      rating: rating ?? this.rating,
      genreId: genreId,
    );
  }
}