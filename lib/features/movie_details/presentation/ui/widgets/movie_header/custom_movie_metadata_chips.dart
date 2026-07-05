import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_header_info.dart';


class MovieMetadataChips extends StatelessWidget {
  final MovieModel movie;
  final bool isMobile;

  const MovieMetadataChips({
    super.key,
    required this.movie,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AgeRatingLabel(rating: movie.ageRating, isMobile: isMobile),
          SizedBox(width: 8.w),
          MovieInfoChip(icon: Icons.calendar_month, text: movie.year.toString(), isMobile: isMobile),
          SizedBox(width: 8.w),
          MovieInfoChip(icon: Icons.schedule, text: "2h 30m", isMobile: isMobile),
          SizedBox(width: 8.w),
          MovieInfoChip(icon: Icons.translate, text: 'English', isMobile: isMobile),
        ],
      ),
    );
  }
}