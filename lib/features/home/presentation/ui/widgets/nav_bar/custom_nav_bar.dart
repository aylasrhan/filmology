import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/routing/routes_names.dart';
import 'package:filmology/features/home/presentation/ui/widgets/nav_bar/center_floating_button.dart';
import 'package:filmology/features/home/presentation/ui/widgets/nav_bar/custom_nav_item.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h, top: 0, left: 10.w, right: 10.w),
      height: 85.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(0.98),
        border: const Border(
          top: BorderSide(color: AppColors.whiteOpacity10, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: NavItem(
              icon: Icons.home_filled,
              label: "Home",
              isActive: true,
              onTap: () => context.go(Routes.home),
            ),
          ),
          Expanded(
            child: NavItem(icon: Icons.search, label: "Search", onTap: () {}),
          ),

          const CenterFloatingButton(),

          Expanded(
            child: NavItem(icon: Icons.reviews, label: "Reviews", onTap: () {}),
          ),
          Expanded(
            child: NavItem(
              icon: Icons.person_outline,
              label: "Profile",
              onTap: () => context.go(Routes.profile),
            ),
          ),
        ],
      ),
    );
  }
}
