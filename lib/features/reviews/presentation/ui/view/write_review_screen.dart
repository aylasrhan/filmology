import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/reviews/data/models/review_model.dart';
import 'package:filmology/features/reviews/presentation/ui/widgets/custom_movie_minicard.dart';
import 'package:filmology/features/reviews/presentation/ui/widgets/custom_Rating_StarsSelector.dart';
import 'package:filmology/features/reviews/presentation/ui/widgets/custom_review_header_background.dart';
import 'package:filmology/features/reviews/presentation/ui/widgets/custom_review_AppBar.dart';
import 'package:filmology/features/reviews/presentation/ui/widgets/custom_review_inputfield.dart';
import 'package:filmology/features/reviews/presentation/ui/widgets/review_submit_section.dart';
class WriteReviewScreen extends StatefulWidget {
  final String movieTitle;
  final String movieSubtitle;
  final String moviePoster;
  final ReviewModel? reviewToEdit;
  final int movieId;
  const WriteReviewScreen({
    super.key,
    required this.movieTitle,
    required this.movieSubtitle,
    required this.moviePoster,
    required this.movieId,
    this.reviewToEdit,
  });
  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}
class _WriteReviewScreenState extends State<WriteReviewScreen> {
  late TextEditingController _reviewController;
  double _rating = 4.0;
  @override
  void initState() {
    super.initState();
    _reviewController = TextEditingController(
      text: widget.reviewToEdit?.comment ?? '',
    );
    _rating = (widget.reviewToEdit?.rating ?? 4.0).toDouble();
    // _rating = widget.reviewToEdit?.rating ?? 4.toDouble();
  }
  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          const ReviewHeaderBackground(),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomReviewAppBar(
                      title: widget.reviewToEdit != null
                          ? "Edit Review"
                          : "Write Review",
                      onCancel: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 32),
                    MovieMiniCard(
                      title: widget.movieTitle,
                      subtitle: widget.movieSubtitle,
                      posterUrl: widget.moviePoster,
                    ),
                    const SizedBox(height: 30),
                    RatingStarsSelector(
                      rating: _rating,
                      primaryColor: AppColors.primary,
                      onRatingChanged: (newRating) =>
                          setState(() => _rating = newRating),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: ReviewInputField(
                        controller: _reviewController,
                        onChanged: () => setState(() {}),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ReviewSubmitSection(
                      controller: _reviewController,
                      rating: _rating,
                      movieId: widget.movieId,
                      reviewToEdit: widget.reviewToEdit,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom / 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
