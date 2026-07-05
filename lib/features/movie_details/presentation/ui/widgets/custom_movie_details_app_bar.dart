import 'package:flutter/material.dart';
import 'custom_icon_button.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onSharePressed;
  final VoidCallback onFavoritePressed;

  const MovieDetailsAppBar({
    super.key,
    required this.onBackPressed,
    required this.onSharePressed,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Positioned(
      top: MediaQuery.of(context).padding.top + (isMobile ? 16 : 20),
      left: isMobile ? 16 : 24,
      right: isMobile ? 16 : 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.arrow_back,
            onPressed: onBackPressed,
            size: isMobile ? 40 : 48,
          ),
          Row(
            children: [
              CustomIconButton(
                icon: Icons.share,
                onPressed: onSharePressed,
                size: isMobile ? 40 : 48,
              ),
              SizedBox(width: isMobile ? 12 : 16),
              CustomIconButton(
                icon: Icons.favorite,
                onPressed: onFavoritePressed,
                size: isMobile ? 40 : 48,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
