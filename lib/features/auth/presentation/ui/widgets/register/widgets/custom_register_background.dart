import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';

class RegisterBackground extends StatelessWidget {
  final Widget child;
  const RegisterBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.backgroundDark.withOpacity(0.8),
                  AppColors.backgroundDark,
                ],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
