import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_shimmer_loading.dart';

class MovieCardPoster extends StatelessWidget {
  final MovieModel movie;
  const MovieCardPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.posterUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => const ShimmerLoadingWidget(),
            errorWidget: (context, url, error) => _buildErrorWidget(),
          ),
          _buildAgeRatingTag(),
        ],
      ),
    );
  }

  Widget _buildAgeRatingTag() {
    return Positioned(
      top: 8.h,
      left: 8.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          movie.ageRating,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[800],
      child: const Icon(Icons.broken_image, color: Colors.white, size: 30),
    );
  }
}
