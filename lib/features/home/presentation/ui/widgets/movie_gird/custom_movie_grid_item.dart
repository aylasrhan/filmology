import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'custom_movie_card_poster.dart'; 
import 'custom_movie_card_info.dart';  
class MovieGridItem extends StatelessWidget {
  final MovieModel movie;
  const MovieGridItem({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        'movieDetails',
        pathParameters: {'movieId': movie.id.toString()},
        extra: movie,
      ),
      borderRadius: BorderRadius.circular(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: MovieCardPoster(movie: movie)),
          const SizedBox(height: 10),
          MovieCardInfo(movie: movie),
        ],
      ),
    );
  }
}