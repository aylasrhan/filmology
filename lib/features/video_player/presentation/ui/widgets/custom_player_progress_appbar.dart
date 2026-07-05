import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'custom_video_progress_bar.dart';

class PlayerProgressBarSection extends StatelessWidget {
  final double currentPosition;
  final double totalDuration;
  final VoidCallback onChangeStart;
  final ValueChanged<double> onChangeEnd;
  final ValueChanged<double> onSliderChanged;

  const PlayerProgressBarSection({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    required this.onChangeStart,
    required this.onChangeEnd,
    required this.onSliderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return VideoProgressBar(
      currentSeconds: currentPosition,
      totalSeconds: totalDuration <= 0 ? 1 : totalDuration,
      primaryColor: AppColors.primary,
      onChangeStart: onChangeStart,
      onChangeEnd: () => onChangeEnd(currentPosition),
      onSliderChanged: onSliderChanged,
    );
  }
}