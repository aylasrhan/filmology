import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:filmology/core/styles/colors/color.dart';

class HeaderBackground extends StatelessWidget {
  final String posterUrl;

  const HeaderBackground({super.key, required this.posterUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CachedNetworkImage(
            imageUrl: posterUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(color: AppColors.backgroundDark),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withOpacity(0.2),
                  AppColors.backgroundDark.withOpacity(0.7),
                  AppColors.backgroundDark,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}