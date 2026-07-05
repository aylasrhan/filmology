import 'package:flutter/material.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_central_play_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CentralPlayButtonLogic extends StatelessWidget {
  final YoutubePlayerController controller;

  const CentralPlayButtonLogic({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<YoutubePlayerValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        bool isEnded = value.playerState == PlayerState.ended;
        bool isBuffering = value.playerState == PlayerState.buffering;

        return CentralPlayButton(
          isPlaying: isEnded ? false : value.isPlaying,
          isBuffering: isBuffering,
          onTap: () {
            if (isEnded) {
              controller.seekTo(Duration.zero);
              controller.play();
            } else {
              value.isPlaying ? controller.pause() : controller.play();
            }
          },
        );
      },
    );
  }
}