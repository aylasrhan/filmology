import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
class CenterFloatingButton extends StatelessWidget {
  const CenterFloatingButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -9.h),
      child: Container(
        width: 55.h,
        height: 55.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.backgroundDark, width: 4),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.6),
              blurRadius: 10,
              spreadRadius: -7,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: Colors.white, size: 28.sp),
        ),
      ),
    );
  }
}
