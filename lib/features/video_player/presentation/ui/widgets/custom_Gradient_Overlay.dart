
import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';

class GradientOverlays extends StatelessWidget {
  const GradientOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.landscape) return const SizedBox.shrink();
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _buildGradientContainer(
            height: 150, 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildGradientContainer(
            height: 180, 
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ],
    );
  }

  Widget _buildGradientContainer({
    double height = 200,
    required AlignmentGeometry begin,
    required AlignmentGeometry end,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: const [
            AppColors.blackOpacity50, 
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}