import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class CustomReviewAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onCancel;

  const CustomReviewAppBar({
    super.key,
    required this.title,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: onCancel,
          icon: const Icon(Icons.arrow_back, color: AppColors.white70),
          label: Text(
            "Cancel",
            style: AppTextStyles.caption.copyWith(
              color: AppColors.white70,
              fontSize: 16,
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 48.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.heading.copyWith(
                fontSize: 18,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
