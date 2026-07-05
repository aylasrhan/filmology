import 'package:flutter/material.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_gradient_overlay.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_video_display_section.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_video_error.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/video_controls_overlay.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerPreview extends StatefulWidget {
  final String videoUrl;
  const TrailerPlayerPreview({super.key, required this.videoUrl});

  @override
  State<TrailerPlayerPreview> createState() => _TrailerPlayerPreviewState();
}

class _TrailerPlayerPreviewState extends State<TrailerPlayerPreview> {
  late YoutubePlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    if (videoId != null && videoId.isNotEmpty) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          hideControls: true,
          useHybridComposition: true,
        ),
      );
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    if (_isInitialized) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: OrientationBuilder(
        builder: (context, orientation) {
          bool isLandscape = orientation == Orientation.landscape;

          if (!_isInitialized) return const VideoErrorWidget();

          return Stack(
            children: [
              VideoDisplaySection(
                controller: _controller,
                isLandscape: isLandscape,
              ),

              if (!isLandscape) const GradientOverlays(),

              VideoControlsOverlay(
                controller: _controller,
                isLandscape: isLandscape,
              ),
            ],
          );
        },
      ),
    );
  }
}
