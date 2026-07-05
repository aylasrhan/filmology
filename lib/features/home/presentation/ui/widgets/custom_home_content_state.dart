import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/home/presentation/cubit/home_cubit.dart';
import 'package:filmology/features/home/presentation/cubit/home_state.dart';
import 'package:filmology/features/home/presentation/ui/widgets/movie_gird/custom_movie_grid.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_section_title.dart';
import 'package:filmology/features/home/presentation/ui/widgets/trending_movies/custom_treanding_movie_list.dart';

class HomeContentState extends StatelessWidget {
  const HomeContentState({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (state is HomeSuccess) {
          return SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(child: SectionHeader(title: "Trending Now")),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: TrendingMoviesList(movies: state.movies),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 25)),
              const SliverToBoxAdapter(
                child: SectionHeader(title: "For You", showSeeAll: false),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              MovieGridWidget(movies: state.movies),
            ],
          );
        } else if (state is HomeError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
