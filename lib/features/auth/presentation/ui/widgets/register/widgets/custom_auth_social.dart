import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'custom_section_divider.dart';
import 'custom_social_button.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionDivider(text: "Or continue with"),
        Row(
          children: [
            Expanded(
              child: SocialButton(
                label: "Google",
                leading: Text("G", style: AppTextStyles.sectionTitle),
                onTap: () {},
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: SocialButton(
                label: "Apple",
                leading: Icon(Icons.apple, color: Colors.white, size: 20.sp),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}