import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_categories_list.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_header_widget.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_search_bar.dart';
class HomeTopSections extends StatelessWidget {
  const HomeTopSections({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const SliverToBoxAdapter(child: HomeHeaderWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const SearchBarWidget(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        const SliverToBoxAdapter(child: CategoriesListWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
      ],
    );
  }
}
