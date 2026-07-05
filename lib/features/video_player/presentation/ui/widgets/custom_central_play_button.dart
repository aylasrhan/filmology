
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';

class CentralPlayButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isPlaying;
  final bool isBuffering;

  const CentralPlayButton({
    super.key,
    required this.onTap,
    required this.isPlaying,
    required this.isBuffering,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r), 
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: isBuffering
            ? SizedBox(
                width: 50.sp,
                height: 50.sp,
                child: const CircularProgressIndicator(color: Colors.white),
              )
            : Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_outlined,
                size: 50.sp, 
                color: AppColors.white,
              ),
      ),
    );
  }
}