import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class SplashFooter extends StatelessWidget {
  const SplashFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50.h,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            'Powered by Mohamad Al-Zoubi | Flutter Beg V.9',
            style: AppTextStyles.footer,
          ),
          SizedBox(height: 25.h),
          Container(
            width: 120.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: AppColors.whiteOpacity10,
              borderRadius: BorderRadius.circular(AppRadius.full.r),
            ),
          ),
        ],
      ),
    );
  }
}
