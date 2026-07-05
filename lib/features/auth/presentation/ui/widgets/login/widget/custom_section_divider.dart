import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/text_style.dart';

class LoginWelcomeSection extends StatelessWidget {
  const LoginWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text("Welcome Back", style: AppTextStyles.loginTitle),
        SizedBox(height: 8.h),
        Text(
          "Log in to track and rate the latest premieres.",
          textAlign: TextAlign.center,
          style: AppTextStyles.loginSubtitle,
        ),
      ],
    );
  }
}
