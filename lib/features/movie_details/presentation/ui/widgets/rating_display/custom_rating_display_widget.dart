import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/rating_display/custom_rating_components.dart';

class RatingDisplayWidget extends StatelessWidget {
  final double rating;

  const RatingDisplayWidget({super.key, this.rating = 0.0});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 1.w : 20.w,
        vertical: isMobile ? 29.h : 20.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8.w : 32.w,
        vertical: isMobile ? 20.h : 24.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(isMobile ? 20.r : 24.r),
        border: Border.all(color: AppColors.white.withOpacity(0.1), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingTitle(title: 'AVERAGE RATING', isMobile: isMobile),
                SizedBox(height: isMobile ? 2 : 14),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      rating.toStringAsFixed(1),
                      style: AppTextStyles.heading.copyWith(
                        fontSize: isMobile ? 32.sp : 38.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: isMobile ? 11 : 14),
                    Flexible(
                      child: StarRatingBar(rating: rating, isMobile: isMobile),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: 1,
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 15.w : 22.w),
            color: AppColors.white.withOpacity(0.15),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RatingTitle(
                  title: 'ROTTEN TOMATOES',
                  isMobile: isMobile,
                  isEnd: true,
                ),
                SizedBox(height: isMobile ? 10 : 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.local_activity,
                      color: Colors.red[400],
                      size: isMobile ? 22.sp : 26.sp,
                    ),
                    SizedBox(width: isMobile ? 6 : 8),
                    Text(
                      '73%',
                      style: AppTextStyles.heading.copyWith(
                        fontSize: isMobile ? 25.sp : 27.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
