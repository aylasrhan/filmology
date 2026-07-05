import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';

class VideoActionIcon extends StatelessWidget {
  final IconData icon;

  const VideoActionIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: AppColors.white,
      size: 24.sp, 
    );
  }
}