import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class ViewAllReviewsButton extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onTap;

  const ViewAllReviewsButton({super.key, required this.isExpanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onTap,
        child: Text(
          isExpanded ? 'Show Less' : 'View All Reviews',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.textSecondary,
            fontSize: 16.sp, 
          ),
        ),
      ),
    );
  }
}