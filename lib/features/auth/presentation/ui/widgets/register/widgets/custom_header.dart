
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64.h,
          width: 64.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withOpacity(0.2),
          
          ),
          child: Icon(
            Icons.movie_filter,
            color: AppColors.primary,
            size: 30.sp,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          "Create Account",
          style: AppTextStyles.crete_account,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          "Start tracking your watchlist and\nreviewing movies today.",
          style: AppTextStyles.registerSubtitle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}