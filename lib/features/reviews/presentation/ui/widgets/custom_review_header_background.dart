import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';

class ReviewHeaderBackground extends StatelessWidget {
  const ReviewHeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final double headerHeight = MediaQuery.of(context).size.height * 0.45;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: headerHeight,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundDarkOpacity80,
              AppColors.black_register,
              AppColors.backgroundDark,
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
      ),
    );
  }
}
