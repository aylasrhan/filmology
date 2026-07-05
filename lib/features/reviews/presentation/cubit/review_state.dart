import 'package:filmology/features/reviews/data/models/review_model.dart';

abstract class ReviewState {}

class ReviewInitial extends ReviewState {}


class ReviewLoading extends ReviewState {}
class ReviewSuccess extends ReviewState {
  final List<ReviewModel> reviews;
  ReviewSuccess(this.reviews);
}
class ReviewError extends ReviewState {
  final String message;
  ReviewError(this.message);
}

class SubmitReviewLoading extends ReviewState {} 
class SubmitReviewSuccess extends ReviewState {} 
class EditReviewSuccess extends ReviewState {}
class SubmitReviewError extends ReviewState {
  final String message;
  SubmitReviewError(this.message);
}