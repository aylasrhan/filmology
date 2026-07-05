import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ZoomableVideoPlayer extends StatelessWidget {
  final YoutubePlayerController controller;

  const ZoomableVideoPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        clipBehavior: Clip.none,
        minScale: 1.0, 
        maxScale: 4.0, 
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}