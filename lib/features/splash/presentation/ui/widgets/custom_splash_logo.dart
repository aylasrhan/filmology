import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            color: AppColors.primarysplash.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppRadius.xl),
            border: Border.all(
              color: AppColors.primarysplash.withOpacity(0.2),
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.movie_filter,
            size: 70,
            color: AppColors.primarysplash,
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.primarysplash,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackOpacity50,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.grade,
              size: 22,
              color: AppColors.backgroundDark,
            ),
          ),
        ),
      ],
    );
  }
}
