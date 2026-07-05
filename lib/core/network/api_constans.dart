class EndPoints {
  static const String baseUrl = "https://movie-platform.focal-x.com/api/";

  static const String register = "register";
  static const String login = "login";
  static const String logout = "logout";

  static const String allMovies = "movies";
  static String movieDetails(int id) => "movies/$id";
  static String searchMovies = "movies/search";

  static String movieReviews(int movieId) => "movies/$movieId/reviews";

  static const String favorites = "favorites";
}

class ApiKeys {
  static const String message = "message";
  static const String token = "token";
  static const String data = "data";
  static const String user = "user";

  static const String id = "id";
  static const String name = "name";
  static const String email = "email";

  static const String password = "password";
  static const String passwordConfirmation = "password_confirmation";

  static const String posterUrl = "poster_url";
  static const String description = "description";
  static const String year = "year";
  static const String rating = "rating";
}
