import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/reviews/data/models/review_model.dart';
import 'package:filmology/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:filmology/features/reviews/presentation/cubit/review_state.dart';
import 'custom_review_actionbuttons.dart';

class ReviewSubmitSection extends StatelessWidget {
  final TextEditingController controller;
  final double rating;
  final int movieId;
  final ReviewModel? reviewToEdit;

  const ReviewSubmitSection({
    super.key,
    required this.controller,
    required this.rating,
    required this.movieId,
    this.reviewToEdit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewCubit, ReviewState>(
      listener: (context, state) {
        if (state is SubmitReviewSuccess || state is EditReviewSuccess) {
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                reviewToEdit != null ? "Review Updated!" : "Review Posted!",
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 1),
            ),
          );
        } else if (state is SubmitReviewError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return ReviewActionButtons(
          primaryColor: AppColors.primary,
          isLoading: state is SubmitReviewLoading,
          onSubmit: () => _handleSubmit(context),
          onDiscard: () => Navigator.pop(context),
        );
      },
    );
  }

  void _handleSubmit(BuildContext context) {
    final comment = controller.text.trim();
    if (comment.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please write a comment first")),
      );
      return;
    }

    if (reviewToEdit != null) {
      context.read<ReviewCubit>().editReview(
        movieId: movieId,
        reviewId: reviewToEdit!.id,
        rating: rating,
        comment: comment,
      );
    } else {
      context.read<ReviewCubit>().addReview(
        movieId: movieId,
        rating: rating,
        comment: comment,
      );
    }
  }
}
