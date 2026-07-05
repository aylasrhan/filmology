import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/reviews_section/custom_review_small_button.dart';

class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final String initials;
  final Color avatarColor;
  final double rating;
  final String reviewText;
  final bool showActions;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ReviewCard({
    super.key,
    required this.reviewerName,
    required this.initials,
    required this.avatarColor,
    required this.rating,
    required this.reviewText,
    required this.showActions,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1432).withOpacity(0.8),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: avatarColor,
                child: Text(initials, 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.sp)),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(reviewerName, 
                          style: AppTextStyles.heading.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        const Icon(Icons.more_horiz, color: Colors.grey),
                      ],
                    ),
                    Row(
                      children: List.generate(5, (index) => Icon(
                        Icons.star,
                        size: 14.sp,
                        color: index < rating ? AppColors.primary : AppColors.textMuted,
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(reviewText, 
            style: AppTextStyles.bodyText.copyWith(color: AppColors.white70, fontSize: 14.sp)),
          
          if (showActions) ...[
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 16.sp, color: AppColors.textSecondary),
                    SizedBox(width: 6.w),
                    Text('0', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, fontSize: 12.sp)),
                  ],
                ),
                Row(
                  children: [
                    ReviewSmallButton(
                      onPressed: onEdit,
                      icon: Icons.edit,
                      label: 'Edit',
                      color: Colors.white.withOpacity(0.7),
                      bgColor: Colors.white.withOpacity(0.1),
                    ),
                    SizedBox(width: 8.w),
                    ReviewSmallButton(
                      onPressed: onDelete,
                      icon: Icons.delete,
                      label: 'Delete',
                      color: Colors.redAccent,
                      bgColor: Colors.red.withOpacity(0.1),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }


}