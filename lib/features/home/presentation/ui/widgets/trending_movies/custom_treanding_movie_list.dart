import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/home/presentation/ui/widgets/trending_movies/custom_trending_movie_item.dart';

class TrendingMoviesList extends StatelessWidget {
  final List<MovieModel> movies;
  const TrendingMoviesList({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return TrendingMovieItem(movie: movies[index]);
        },
      ),
    );
  }
}
