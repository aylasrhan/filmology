import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SeekVideoButton extends StatelessWidget {
  final YoutubePlayerController controller;
  final IconData icon;
  final int seconds;
  final Function(double)? onManualSeek;

  const SeekVideoButton({
    super.key,
    required this.controller,
    required this.icon,
    required this.seconds,
    this.onManualSeek,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final currentPosition = controller.value.position;
        final totalDuration = controller.metadata.duration;

        Duration newPosition = currentPosition + Duration(seconds: seconds);

        if (newPosition < Duration.zero) newPosition = Duration.zero;
        if (newPosition > totalDuration) newPosition = totalDuration;

        if (onManualSeek != null) {
          onManualSeek!(newPosition.inSeconds.toDouble());
        }
      },
      icon: Icon(icon, color: AppColors.white, size: 28.sp),
    );
  }
}