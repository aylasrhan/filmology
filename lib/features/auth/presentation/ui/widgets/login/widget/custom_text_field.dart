import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const LoginTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.suffix,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      style: AppTextStyles.bodyText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.text_span1,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 8.w),
          child: Icon(icon, color: AppColors.gray2, size: 22.sp),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: suffix,
        ),
        filled: true,
        fillColor: AppColors.InputBackground,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2.w),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
    );
  }
}
