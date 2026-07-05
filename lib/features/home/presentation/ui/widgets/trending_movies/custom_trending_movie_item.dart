import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'custom_trending_movie_poster.dart';
import 'custom_trending_movie_info.dart';

class TrendingMovieItem extends StatelessWidget {
  final MovieModel movie;
  const TrendingMovieItem({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          'movieDetails',
          pathParameters: {'movieId': movie.id.toString()},
          extra: movie,
        );
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 130.w,
        margin: EdgeInsets.only(right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: TrendingMoviePoster(movie: movie)),
            const SizedBox(height: 8),
            TrendingMovieInfo(movie: movie),
          ],
        ),
      ),
    );
  }
}
