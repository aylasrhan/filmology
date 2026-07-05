import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class MovieActionsRow extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onWatchTrailer;
  final VoidCallback onBookmark;

  const MovieActionsRow({
    super.key,
    required this.isMobile,
    required this.onWatchTrailer,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40.w),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: onWatchTrailer,
              icon: Icon(Icons.play_arrow, size: isMobile ? 26.sp : 32.sp),
              label: Text(
                'Watch Trailer',
                style: AppTextStyles.heading.copyWith(
                  fontSize: isMobile ? 20.sp : 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: isMobile ? 18.h : 22.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
              ),
            ),
          ),
          const SizedBox(width: 14), 
          Material(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.backgroundLight,
            child: InkWell(
              onTap: onBookmark,
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: isMobile ? 54.w : 70.w,
                height: isMobile ? 54.h : 70.h,
                alignment: Alignment.center,
                child: Icon(
                  Icons.bookmark_add,
                  color: AppColors.white,
                  size: isMobile ? 28.sp : 36.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}