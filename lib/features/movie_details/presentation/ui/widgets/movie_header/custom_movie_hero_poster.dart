import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieHeroPoster extends StatelessWidget {
  final int id;
  final String posterUrl;
  final bool isMobile;

  const MovieHeroPoster({super.key, required this.id, required this.posterUrl, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        width: isMobile ? 180.w : 250.w,
        height: isMobile ? 260.h : 350.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
            image: CachedNetworkImageProvider(posterUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}