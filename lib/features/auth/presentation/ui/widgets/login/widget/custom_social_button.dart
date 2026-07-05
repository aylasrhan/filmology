import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_social_button.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SocialButton(
                label: "Facebook",
                leading: Icon(Icons.facebook, color: Colors.white, size: 18.sp),
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
