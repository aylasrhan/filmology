import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class SectionDivider extends StatelessWidget {
  final String text;
  const SectionDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, bottom: 24.h),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: AppColors.borderColor)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(text, style: AppTextStyles.text_divider),
          ),
          Expanded(child: Divider(thickness: 1, color: AppColors.borderColor)),
        ],
      ),
    );
  }
}