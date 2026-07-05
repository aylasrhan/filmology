import 'package:flutter/material.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_player_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'custom_central-playbutton_logic.dart';
import 'custom_player_top_abbbar.dart';

class VideoControlsOverlay extends StatelessWidget {
  final YoutubePlayerController controller;
  final bool isLandscape;

  const VideoControlsOverlay({
    super.key,
    required this.controller,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isLandscape ? const SizedBox.shrink() : const PlayerTopAppBar(),

          CentralPlayButtonLogic(controller: controller),

          PlayerBottomPanel(controller: controller),
        ],
      ),
    );
  }
}
