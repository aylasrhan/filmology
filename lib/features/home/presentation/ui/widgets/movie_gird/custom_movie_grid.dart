import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/home/presentation/ui/widgets/movie_gird/custom_movie_grid_item.dart';

class MovieGridWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const MovieGridWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15.w,
          childAspectRatio: 0.6,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => MovieGridItem(movie: movies[index]),
          childCount: movies.length,
        ),
      ),
    );
  }
}
