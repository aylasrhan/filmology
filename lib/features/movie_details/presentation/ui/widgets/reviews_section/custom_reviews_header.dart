import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class ReviewsHeader extends StatelessWidget {
  final int count;
  final VoidCallback onPostReview;

  const ReviewsHeader({
    super.key,
    required this.count,
    required this.onPostReview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Reviews ($count)',
            style: AppTextStyles.heading.copyWith(
              fontSize: 20.sp, 
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton.icon(
            onPressed: onPostReview,
            icon: Icon(
              Icons.rate_review,
              size: 18.sp,
              color: AppColors.primary,
            ),
            label: Text(
              'Post Review',
              style: AppTextStyles.caption.copyWith(
                fontSize: 13.sp,
                color: AppColors.primary,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary.withOpacity(0.2),
              side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
