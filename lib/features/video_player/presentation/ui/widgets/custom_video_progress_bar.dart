import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class VideoProgressBar extends StatelessWidget {
  final double currentSeconds;
  final double totalSeconds;
  final Color primaryColor;
  final ValueChanged<double> onSliderChanged;
  final VoidCallback? onChangeStart;
  final VoidCallback? onChangeEnd;

  const VideoProgressBar({
    super.key,
    required this.currentSeconds,
    required this.totalSeconds,
    required this.primaryColor,
    required this.onSliderChanged,
    this.onChangeStart,
    this.onChangeEnd,
  });

  String _formatDuration(double seconds) {
    if (seconds < 0) seconds = 0;
    final duration = Duration(seconds: seconds.toInt());
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final secs = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4.0,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
            activeTrackColor: primaryColor,
            inactiveTrackColor: AppColors.white.withOpacity(0.3),
            thumbColor: primaryColor,
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: Slider(
            value: currentSeconds.clamp(0.0, totalSeconds),
            min: 0.0,
            max: totalSeconds <= 0 ? 1.0 : totalSeconds,
            onChanged: onSliderChanged,
            onChangeStart: (val) => onChangeStart?.call(),
            onChangeEnd: (val) => onChangeEnd?.call(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(currentSeconds),
                style: AppTextStyles.timeLabel,
              ),
              Text(
                _formatDuration(totalSeconds),
                style: AppTextStyles.timeLabel,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
