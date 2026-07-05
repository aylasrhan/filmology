import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';

class TrendingMovieInfo extends StatelessWidget {
  final MovieModel movie;
  const TrendingMovieInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: AppTextStyles.movieTitle.copyWith(fontSize: 14.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          movie.ageRating,
          style: AppTextStyles.movieSubtitle.copyWith(fontSize: 12.sp),
          maxLines: 1,
        ),
      ],
    );
  }
}
