import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/text_style.dart';

class HeaderGreetingsSection extends StatelessWidget {
  const HeaderGreetingsSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back,",
          style: AppTextStyles.subtitle.copyWith(fontSize: 14.sp),
        ),
        Text(
          "Discover",
          style: AppTextStyles.usernametext.copyWith(fontSize: 28.sp),
        ),
      ],
    );
  }
}
