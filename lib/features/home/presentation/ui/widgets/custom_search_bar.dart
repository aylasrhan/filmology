import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/home/presentation/cubit/home_cubit.dart'; 

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
      child: Container(
        height: 50.h,
        decoration: _buildSearchBarDecoration(),
        child: TextField(
          onChanged: (query) {
            context.read<HomeCubit>().searchMovies(query);
          },
          textAlignVertical: TextAlignVertical.center,
          style: TextStyle(color: AppColors.white, fontSize: 14.sp),
          decoration: _buildInputDecoration(),
        ),
      ),
    );
  }

  BoxDecoration _buildSearchBarDecoration() {
    return BoxDecoration(
      color: AppColors.InputBackground2,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: AppColors.whiteOpacity10),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: "Search movies, actors...",
      hintStyle: AppTextStyles.subtitle.copyWith(fontSize: 14.sp),
      prefixIcon: Icon(Icons.search, color: AppColors.colorIcon, size: 22.sp),
      suffixIcon: _buildSuffixFilterIcon(),
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
    );
  }

  Widget _buildSuffixFilterIcon() {
    return IconButton(
      onPressed: () {}, 
      icon: Icon(Icons.tune, color: AppColors.colorIcon, size: 22.sp),
    );
  }
}