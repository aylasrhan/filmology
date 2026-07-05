class ReviewModel {
  final int id;
  final double rating;
  final String comment;
  final String userName;
  final String userEmail;
  final int movieId;

  ReviewModel({
    required this.id,
    required this.rating,
    required this.comment,
    required this.userName,
    required this.userEmail,
    required this.movieId,
  });
  ReviewModel copyWith({String? comment, double? rating}) {
    return ReviewModel(
      id: id,
      userName: userName,
      userEmail: userEmail,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      movieId: movieId,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] as Map<String, dynamic>?;

    return ReviewModel(
      id: json['id'] ?? 0,
      rating:double.tryParse(json['rating'].toString()) ?? 0.0,
      comment: json['comment'] ?? '',

      userName: userData != null ? userData['name'] ?? 'Guest' : 'Guest',

      userEmail: userData != null ? userData['email'] ?? '' : '',

      movieId: json['movie_id'] ?? 0,
    );
  }
}
