import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/home/presentation/cubit/home_cubit.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_home_content_state.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_home_top_section.dart';
import 'package:filmology/features/home/presentation/ui/widgets/nav_bar/custom_nav_bar.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const HomeTopSections(),
                const HomeContentState(), 
                const SliverToBoxAdapter(child: SizedBox(height: 110)),
              ],
            ),
            const Positioned(
              bottom: 0, left: 0, right: 0,
              child: BottomNavBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}