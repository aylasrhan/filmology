import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_seek_video_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class CustomYoutubeButtons extends StatelessWidget {
  final YoutubePlayerController controller;
  final Function(double)? onManualSeek;
  const CustomYoutubeButtons({
    super.key,
    required this.controller,
    this.onManualSeek,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildActionIcon(Icons.volume_up_outlined),
            const SizedBox(width: 24),
            _buildActionIcon(Icons.closed_caption_outlined),
          ],
        ),
        Row(
          children: [
           SeekVideoButton(
  controller: controller,
  icon: Icons.replay_10,
  seconds: -10,
  onManualSeek: onManualSeek,
),
            const SizedBox(width: 8),
            _buildPlayPauseButton(),
            const SizedBox(width: 8),
SeekVideoButton(
  controller: controller,
  icon: Icons.forward_10,
  seconds: 10,
  onManualSeek: onManualSeek,
),          ],
        ),
        Row(
          children: [
            _buildActionIcon(Icons.settings_outlined),

            const SizedBox(width: 24),

            _buildActionIcon(Icons.fullscreen),
          ],
        ),
      ],
    );
  }
Widget _buildPlayPauseButton() {
  return ValueListenableBuilder<YoutubePlayerValue>(
    valueListenable: controller,
    builder: (context, value, child) {
      final bool isEnded = value.playerState == PlayerState.ended;
      return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        splashRadius: 24, 
        icon: Icon(
          isEnded
              ? Icons.replay
              : (value.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded),
          color: AppColors.white,
          size: 42,
        ),
        onPressed: () {
          if (isEnded) {
            controller.seekTo(Duration.zero);
            controller.play();
          } else {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          }
        },
      );
    },
  );
}
  Widget _buildActionIcon(IconData icon) {
    return Icon(icon, color: AppColors.white, size: 24);
  }

}
