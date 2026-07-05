
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_player_progress_appbar.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_youtube_controls.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class PlayerBottomPanel extends StatefulWidget {
  final YoutubePlayerController controller;
  const PlayerBottomPanel({super.key, required this.controller});
  @override
  State<PlayerBottomPanel> createState() => _PlayerBottomPanelState();
}
class _PlayerBottomPanelState extends State<PlayerBottomPanel> {
  double _currentPosition = 0;
  bool _blockUpdates = false;
  Timer? _debounceTimer;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_videoListener);
  }
  void _videoListener() {
    if (!_blockUpdates && mounted) {
      final newPos = widget.controller.value.position.inSeconds.toDouble();
      if (newPos != _currentPosition) {
        setState(() => _currentPosition = newPos);
      }
    }
  }
  void _handleManualAction(double newPosition) {
    _debounceTimer?.cancel();
    setState(() {
      _blockUpdates = true;
      _currentPosition = newPosition;
    });
    widget.controller.seekTo(Duration(seconds: newPosition.toInt()));
    _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
      if (mounted) setState(() => _blockUpdates = false);
    });
  }
  @override
  void dispose() {
    widget.controller.removeListener(_videoListener);
    _debounceTimer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final double duration = widget.controller.metadata.duration.inSeconds.toDouble();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h), // ريسبونسيف
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PlayerProgressBarSection(
            currentPosition: _currentPosition,
            totalDuration: duration,
            onChangeStart: () => _blockUpdates = true,
            onSliderChanged: (newValue) => setState(() => _currentPosition = newValue),
            onChangeEnd: (val) => _handleManualAction(val),
          ),
          SizedBox(height: 16.h), 
          CustomYoutubeButtons(
            controller: widget.controller,
            onManualSeek: (newSeconds) => _handleManualAction(newSeconds),
          ),
        ],
      ),
    );
  }
}
