import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class MovieMainInfo extends StatelessWidget {
  final String title;
  final String genre;
  final bool isMobile;

  const MovieMainInfo({super.key, required this.title, required this.genre, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.heading.copyWith(
            fontSize: isMobile ? 28.sp : 35.sp,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8.h),
        Text(
          genre,
          style: AppTextStyles.movieSubtitle.copyWith(
            color: AppColors.white.withOpacity(0.7),
            fontSize: isMobile ? 14.sp : 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}