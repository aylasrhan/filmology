import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:  AppColors.backgroundbulidprofileitem,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.borderimageprofile,
      unselectedItemColor: AppColors.whiteemail,
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search_sharp), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.reviews), label: 'Reviews'),
        BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Profile'),
      ],
    );
  }
}
