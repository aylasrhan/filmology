
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/routing/routes_names.dart';
import 'package:filmology/core/styles/colors/color.dart'; 
import 'package:filmology/features/profil1/presentation/cubit/profil_cubit.dart';
import 'package:filmology/features/profil1/presentation/cubit/profile_state.dart';
import 'package:filmology/features/profil1/presentation/ui/wedgets/custom_buttomnavbar.dart';
import 'package:filmology/features/profil1/presentation/ui/wedgets/custom_logout_button.dart';
import 'package:filmology/features/profil1/presentation/ui/wedgets/custom_profile-item.dart';
import 'package:filmology/features/profil1/presentation/ui/wedgets/custom_profile_header.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkSplash, 
      body: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            String name = "Loading...";
            String email = "...";

            if (state is ProfileSuccess) {
              name = state.user.name ?? "User";
              email = state.user.email ?? "";
            } else if (state is ProfileError) {
              name = "Error";
              email = state.errMessage;
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProfileHeader(
                    name: name,
                    email: email,
                  ),
                  
                  SizedBox(height: 32.h),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        ProfileMenuItem(
                          icon: Icons.bookmark,
                          title: 'My Watchlist',
                          onTap: () {},
                        ),
                        ProfileMenuItem(
                          icon: Icons.rate_review,
                          title: 'My Reviews',
                          onTap: () {},
                        ),
                        ProfileMenuItem(
                          icon: Icons.settings,
                          title: 'Settings',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 40),
                  const LogoutSection(),
                  SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 0) {
            context.go(Routes.home);
          }
        },
      ),
    );
  }
}