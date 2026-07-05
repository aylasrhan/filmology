import 'package:filmology/features/reviews/data/models/review_model.dart';

class ReviewsHelper {
  static List<ReviewModel> getSortedReviews(List<ReviewModel> reviews, String? currentUserEmail) {
    return List<ReviewModel>.from(reviews)
      ..sort((a, b) {
        if (currentUserEmail != null && a.userEmail == currentUserEmail) return -1;
        if (currentUserEmail != null && b.userEmail == currentUserEmail) return 1;
        return 0;
      });
  }
}