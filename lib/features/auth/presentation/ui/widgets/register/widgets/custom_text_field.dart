import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class RegisterTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const RegisterTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.suffix,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyles.bodyText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.text_span1,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 14.w, right: 6.w),
          child: Icon(icon, color: AppColors.gray2, size: 20.sp),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 14.w),
          child: suffix,
        ),
        filled: true,
        fillColor: AppColors.backgroundLight,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),

        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 11.sp,
          height: 0.8,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: BorderSide(color: AppColors.whiteOpacity5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
    );
  }
}
