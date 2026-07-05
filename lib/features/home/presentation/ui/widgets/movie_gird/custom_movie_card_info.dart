import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';

class MovieCardInfo extends StatelessWidget {
  final MovieModel movie;
  const MovieCardInfo({super.key, required this.movie});

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
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 14.sp),
            SizedBox(width: 4.w),
            Text(
              movie.rating.toString(),
              style: AppTextStyles.movieSubtitle.copyWith(fontSize: 12.sp),
            ),
            Text(
              "   •   ${movie.year}",
              style: AppTextStyles.movieSubtitle.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }
}
