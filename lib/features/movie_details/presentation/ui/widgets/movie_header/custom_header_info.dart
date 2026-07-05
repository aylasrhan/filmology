import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class MovieInfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isMobile;

  const MovieInfoChip({super.key, required this.icon, required this.text, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14.w : 18.w,
        vertical: isMobile ? 9.h : 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Icon(icon, size: isMobile ? 16.sp : 18.sp, color: AppColors.white.withOpacity(0.7)),
          const SizedBox(width: 7), 
          Text(
            text,
            style: AppTextStyles.movieSubtitle.copyWith(
              color: AppColors.white.withOpacity(0.7),
              fontSize: isMobile ? 13.sp : 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AgeRatingLabel extends StatelessWidget {
  final String rating;
  final bool isMobile;

  const AgeRatingLabel({super.key, required this.rating, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10.w : 14.w,
        vertical: isMobile ? 5 : 7,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        rating,
        style: AppTextStyles.labelStyle.copyWith(
          color: AppColors.white,
          fontSize: isMobile ? 11.sp : 13.sp,
        ),
      ),
    );
  }
}