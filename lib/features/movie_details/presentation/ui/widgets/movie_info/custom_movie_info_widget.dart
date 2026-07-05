import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_info/custom_movie_info_sub.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/rating_display/custom_rating_display_widget.dart';


class MovieInfoWidget extends StatelessWidget {
  final MovieModel movie;

  const MovieInfoWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16.w : 24.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(0.95),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        border: Border.all(color: AppColors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingDisplayWidget(rating: 7.0 + (movie.id % 26) / 10.0),
          
          const SizedBox(height: 15), 

          Text(
            'Synopsis',
            style: AppTextStyles.heading.copyWith(
              fontSize: isMobile ? 25.sp : 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15), 

          Text(
            movie.description,
            style: AppTextStyles.bodyText.copyWith(
              fontSize: isMobile ? 16.sp : 17.sp,
              height: 1.7,
            ),
          ),

          const SizedBox(height: 1), 

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              child: Text(
                'Read more',
                style: AppTextStyles.movieSubtitle.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 18.sp : 18.sp,
                ),
              ),
            ),
          ),

          CastSection(isMobile: isMobile),

          const SizedBox(height: 24), 
        ],
      ),
    );
  }
}