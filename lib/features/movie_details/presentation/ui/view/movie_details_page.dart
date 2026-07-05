import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/di/service_locator.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/custom_movie_details_app_bar.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_movie_headertest.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_info/custom_movie_info_widget.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/reviews_section/custom_reviews_section.dart';
import 'package:filmology/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:filmology/features/reviews/presentation/cubit/review_state.dart';
import '../../../../../core/styles/colors/color.dart';


class MovieDetailsPage extends StatefulWidget { 
  final MovieModel? movie;
  final int movieId;

  const MovieDetailsPage({
    super.key,
    this.movie,
    required this.movieId,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late final ReviewCubit _reviewCubit;

  @override
  void initState() {
    super.initState();
    _reviewCubit = getIt<ReviewCubit>()..fetchReviews(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movie == null) {
      return const Scaffold(
        body: Center(child: Text("Movie data missing, please go back.")),
      );
    }

    return BlocProvider.value(
      value: _reviewCubit,
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  MovieHeaderWidget(movie: widget.movie!), 
                  MovieDetailsAppBar(
                    onBackPressed: () => context.pop(),
                    onSharePressed: () {},
                    onFavoritePressed: () {},
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundDark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    MovieInfoWidget(movie: widget.movie!),
                    BlocBuilder<ReviewCubit, ReviewState>(
                      builder: (context, state) {
                        if (state is ReviewLoading) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
                          );
                        } else if (state is ReviewSuccess) {
                          return ReviewsSectionWidget(
                            movieId: widget.movieId,
                            reviews: state.reviews,
                            movieTitle: widget.movie!.title,
                            movieSubtitle: "${widget.movie!.year} • ${widget.movie!.genreName}",
                            moviePoster: widget.movie!.posterUrl,
                          );
                        } else if (state is ReviewError) {
                          return Center(child: Text(state.message, style: const TextStyle(color: Colors.redAccent)));
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}