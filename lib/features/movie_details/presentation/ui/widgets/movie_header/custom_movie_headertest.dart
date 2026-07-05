import 'package:flutter/widgets.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_header_background.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/movie_header/custom_header_content.dart';

class MovieHeaderWidget extends StatelessWidget {
  final MovieModel movie;

  const MovieHeaderWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      height: isMobile ? screenHeight * 0.85 : screenHeight * 0.95,
      width: double.infinity,
      child: Stack(
        children: [
          HeaderBackground(posterUrl: movie.posterUrl),
          
          HeaderContent(movie: movie, isMobile: isMobile),
        ],
      ),
    );
  }
}