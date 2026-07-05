import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';


class RatingTitle extends StatelessWidget {
  final String title;
  final bool isMobile;
  final bool isEnd;

  const RatingTitle({super.key, required this.title, required this.isMobile, this.isEnd = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: isEnd ? TextAlign.end : TextAlign.start,
      style: AppTextStyles.labelStyle.copyWith(
        color: AppColors.white.withOpacity(0.6),
        fontSize: isMobile ? 12.sp : 15.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
        
      ),
    );
  }
}

class StarRatingBar extends StatelessWidget {
  final double rating;
  final bool isMobile;

  const StarRatingBar({super.key, required this.rating, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: isMobile ? 1 : 2,
      children: [
        for (int i = 1; i <= 5; i++)
          Icon(
            (rating / 2) >= i
                ? Icons.star
                : ((rating / 2) >= i - 0.5 ? Icons.star_half : Icons.star_border),
            color: AppColors.primary,
            size: isMobile ?15.sp : 20.sp
          ),
      ],
    );
  }
}