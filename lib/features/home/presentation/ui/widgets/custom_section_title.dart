import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/text_style.dart';
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool showSeeAll;
  const SectionHeader({
    super.key,
    required this.title,
    this.onPressed,
    this.showSeeAll = true,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.sectionTitle),
          if (showSeeAll)
            GestureDetector(
              onTap: onPressed,
              child: Text(
                "See all",
                style: AppTextStyles.link.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
