import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_shimmer_loading.dart';

class TrendingMoviePoster extends StatelessWidget {
  final MovieModel movie;
  const TrendingMoviePoster({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: movie.posterUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => const ShimmerLoadingWidget(),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[800],
              child: const Icon(Icons.broken_image, color: Colors.white),
            ),
          ),
          _buildRatingBadge(movie.rating.toString()),
        ],
      ),
    );
  }

  Widget _buildRatingBadge(String rating) {
    return Positioned(
      top: 8.h,
      right: 8.w,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 12.sp),
            const SizedBox(width: 4),
            Text(
              rating,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
