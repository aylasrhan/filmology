import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_movie_actions_row.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_movie_hero_poster.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_movie_main_info.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_movie_metadata_chips.dart';

class HeaderContent extends StatelessWidget {
  final MovieModel movie;
  final bool isMobile;

  const HeaderContent({super.key, required this.movie, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final bool isSmallMobile = MediaQuery.of(context).size.height < 700;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.w : 30.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              
              MovieHeroPoster(id: movie.id, posterUrl: movie.posterUrl, isMobile: isMobile),
              
              SizedBox(height: isSmallMobile ? 15.h : 25.h),

              MovieMainInfo(title: movie.title, genre: movie.genreName, isMobile: isMobile),
              
              SizedBox(height: 15.h),

              MovieMetadataChips(movie: movie, isMobile: isMobile),

              SizedBox(height: isSmallMobile ? 30.h : 45.h),

              MovieActionsRow(
                isMobile: isMobile,
                onWatchTrailer: () => _handleTrailer(context, movie),
                onBookmark: () {},
              ),
              
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
  
  void _handleTrailer(BuildContext context, MovieModel movie) {
    if (movie.trailerUrl != null && movie.trailerUrl!.isNotEmpty) {
      final encodedUrl = Uri.encodeComponent(movie.trailerUrl!);
      context.pushNamed('trailerPlayer', pathParameters: {'videoUrl': encodedUrl});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Trailer not available")),
      );
    }
  }
}