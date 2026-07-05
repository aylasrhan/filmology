
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 40), 
          Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: AppColors.borderimageprofile,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: AppColors.gray3,
              backgroundImage: const AssetImage('assets/images/profile_image.jpg'),
            ),
          ),
          SizedBox(height: 16),
          Text(name, style: AppTextStyles.usernametext),
          SizedBox(height: 4),
          Text(email, style: AppTextStyles.emailtext),
        ],
      ),
    );
  }
}