import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/di/service_locator.dart';
import 'package:filmology/core/routing/routes_names.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:filmology/features/auth/presentation/ui/view/register_screen.dart';
import 'package:filmology/features/auth/presentation/ui/view/login_screen.dart';
import 'package:filmology/features/home/presentation/cubit/home_cubit.dart';
import 'package:filmology/features/home/data/models/movie_model.dart';
import 'package:filmology/features/home/presentation/ui/view/home_screen.dart';
import 'package:filmology/features/movie_details/presentation/ui/view/movie_details_page.dart';
import 'package:filmology/features/profil1/presentation/cubit/profil_cubit.dart';
import 'package:filmology/features/profil1/presentation/ui/view/profile_screen.dart';
import 'package:filmology/features/reviews/data/models/review_model.dart';
import 'package:filmology/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:filmology/features/reviews/presentation/ui/view/write_review_screen.dart';
import 'package:filmology/features/splash/presentation/ui/view/splash_screen.dart';
import 'package:filmology/features/video_player/presentation/ui/view/trailer-player_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,

    navigatorKey: _rootNavigatorKey,

    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '${Routes.trailerPlayer}/:videoUrl',
        name: 'trailerPlayer',
        builder: (context, state) {
          final String? videoUrl = state.pathParameters['videoUrl'];
          final decodedUrl = Uri.decodeComponent(videoUrl ?? '');
          return TrailerPlayerPreview(videoUrl: decodedUrl);
        },
      ),

      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),

GoRoute(
  path: '${Routes.writeReview}/:movieId/:title/:subtitle/:posterUrl',
  name: 'writeReview',
  builder: (context, state) {
    final movieId = int.parse(state.pathParameters['movieId']!);
    final title = state.pathParameters['title']!;
    final subtitle = state.pathParameters['subtitle']!;
    final posterUrl = Uri.decodeComponent(state.pathParameters['posterUrl']!);
    
    final reviewToEdit = state.extra as ReviewModel?; 

    return BlocProvider(
      create: (context) => getIt<ReviewCubit>(), 
      child: WriteReviewScreen(
        movieId: movieId,
        movieTitle: title,
        movieSubtitle: subtitle,
        moviePoster: posterUrl,
        reviewToEdit: reviewToEdit,
      ),
    );
  },
),
GoRoute(
  path: Routes.profile,
  name: 'profile',
  builder: (context, state) => BlocProvider(
    create: (context) => getIt<ProfileCubit>()..fetchUserProfile(),
    child: const ProfileScreen(),
  ),
),
      GoRoute(
        path: Routes.home,
        name: 'home',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomeCubit>()..fetchAllMovies(),
          child: const MovieHomeScreen(),
        ),
      ),
GoRoute(
  path: '${Routes.movieDetails}/:movieId',
  name: 'movieDetails',
  builder: (context, state) {
    final String? movieIdRaw = state.pathParameters['movieId'];
    final int movieId = int.tryParse(movieIdRaw ?? '0') ?? 0;

    final movieFromExtra = state.extra as MovieModel?;

    return MovieDetailsPage(
      movieId: movieId,
      movie: movieFromExtra,
    );
  },
),
      GoRoute(
        path: Routes.register,
        name: 'register',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const RegisterScreen(),
        ),
      ),

      GoRoute(
        path: Routes.login,
        name: 'login',
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
    ],
  );
}
