import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDisplaySection extends StatelessWidget {
  final YoutubePlayerController controller;
  final bool isLandscape;

  const VideoDisplaySection({
    super.key,
    required this.controller,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        clipBehavior: Clip.none,
        minScale: 1.0,
        maxScale: 4.0,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: isLandscape
              ? MediaQuery.of(context).size.height
              : MediaQuery.of(context).size.width * (9 / 16),
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
          ),
        ),
      ),
    );
  }
}