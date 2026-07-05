
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/reviews_section/custom_review_card.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/reviews_section/custom_reviews_header.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/reviews_section/custom_reviews_logic_helper.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/reviews_section/custom_view_all_button.dart';
import 'package:filmology/features/reviews/data/models/review_model.dart';
import 'package:filmology/features/reviews/presentation/cubit/review_cubit.dart';


class ReviewsSectionWidget extends StatefulWidget {
  final List<ReviewModel> reviews;
  final String movieTitle;
  final String movieSubtitle;
  final String moviePoster;
  final int movieId;

  const ReviewsSectionWidget({
    super.key,
    required this.reviews,
    required this.movieTitle,
    required this.movieSubtitle,
    required this.moviePoster,
    required this.movieId,
  });

  @override
  State<ReviewsSectionWidget> createState() => _ReviewsSectionWidgetState();
}

class _ReviewsSectionWidgetState extends State<ReviewsSectionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String? currentUserEmail = context.watch<ReviewCubit>().currentUserEmail;

    final sortedReviews = ReviewsHelper.getSortedReviews(widget.reviews, currentUserEmail);
    final displayedReviews = isExpanded ? sortedReviews : sortedReviews.take(2).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: const BoxDecoration(color: AppColors.backgroundDark),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewsHeader(
            count: widget.reviews.length,
            onPostReview: () => _navigateToWriteReview(context),
          ),

          ...displayedReviews.map((review) {
            bool isMyReview = currentUserEmail != null && review.userEmail == currentUserEmail;
            return ReviewCard(
              reviewerName: isMyReview ? "${review.userName} (You)" : review.userName,
              initials: review.userName.isNotEmpty ? review.userName[0].toUpperCase() : 'U',
              avatarColor: isMyReview ? const Color(0xFF422170) : AppColors.whiteOpacity60,
              rating: review.rating,
              reviewText: review.comment,
              showActions: isMyReview,
              onEdit: () => _navigateToWriteReview(context, review: review),
              onDelete: () => _deleteReview(context, review.id),
            );
          }).toList(),

          const SizedBox(height: 16),

          if (widget.reviews.length > 2)
            ViewAllReviewsButton(
              isExpanded: isExpanded,
              onTap: () => setState(() => isExpanded = !isExpanded),
            ),
        ],
      ),
    );
  }

  void _deleteReview(BuildContext context, int reviewId) {
    context.read<ReviewCubit>().deleteReview(
          movieId: widget.movieId,
          reviewId: reviewId,
        );
  }


  void _navigateToWriteReview(BuildContext context, {ReviewModel? review}) async {
    final bool? result = await context.pushNamed<bool>(
      'writeReview',
      pathParameters: {
        'movieId': widget.movieId.toString(),
        'title': widget.movieTitle,
        'subtitle': widget.movieSubtitle,
        'posterUrl': Uri.encodeComponent(widget.moviePoster),
      },
      extra: review,
    );

    if (result == true && context.mounted) {
      context.read<ReviewCubit>().fetchReviews(widget.movieId);
    }
  }
}
