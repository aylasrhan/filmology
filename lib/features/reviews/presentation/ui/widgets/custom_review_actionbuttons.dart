import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class ReviewActionButtons extends StatelessWidget {
  final VoidCallback onSubmit;
  final VoidCallback onDiscard;
  final bool isLoading;

  const ReviewActionButtons({
    super.key,
    required this.onSubmit,
    required this.onDiscard,
    this.isLoading = false,
    required Color primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 1,
            ),
            onPressed: isLoading ? null : onSubmit,
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    "Submit Review",
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.white,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: isLoading ? null : onDiscard,
          child: Text(
            "Discard Changes",
            style: AppTextStyles.caption.copyWith(color: AppColors.white38),
          ),
        ),
      ],
    );
  }
}
