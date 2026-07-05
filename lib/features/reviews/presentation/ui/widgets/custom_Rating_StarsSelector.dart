import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class RatingStarsSelector extends StatelessWidget {
  final double rating;
  final Color primaryColor;
  final Function(double) onRatingChanged;

  const RatingStarsSelector({
    super.key,
    required this.rating,
    required this.primaryColor,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("TAP TO RATE", style: AppTextStyles.labelStyle),
        const SizedBox(height: 16),
        _buildStarsRow(),
        const SizedBox(height: 12),
        _buildRatingText(),
      ],
    );
  }

  Widget _buildStarsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final double starValue = index + 1.0;

        return GestureDetector(
          onTapDown: (details) {
            const double starSize = 44.0;
            if (details.localPosition.dx < starSize / 2) {
              onRatingChanged(index + 0.5);
            } else {
              onRatingChanged(index + 1.0);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Icon(
              rating >= starValue
                  ? Icons.star
                  : (rating >= starValue - 0.5
                        ? Icons.star_half
                        : Icons.star_border), // نصف أو فارغة
              size: 44,
              color: rating >= starValue - 0.5
                  ? primaryColor
                  : Colors.white.withOpacity(0.1),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildRatingText() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${rating.toStringAsFixed(1)} ",
            style: AppTextStyles.heading.copyWith(
              color: AppColors.primary,
              fontSize: 24,
            ),
          ),
          TextSpan(
            text: "/ 5.0",
            style: AppTextStyles.caption.copyWith(
              color: AppColors.white24,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
