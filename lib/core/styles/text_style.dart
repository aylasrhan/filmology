import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';

class AppTextStyles {
  static const String fontFamily = 'BeVietnamPro';
  static const String secondaryFont = 'NotoSans';
  static TextStyle get splashTitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 36.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
    letterSpacing: -0.5,
  );
  static TextStyle get splashSubtitle => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.ssd,
    letterSpacing: 1.5,
  );
  static TextStyle get averageRatingNumber => TextStyle(
    fontFamily: fontFamily,
    fontSize: 36.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );
  static TextStyle get loginTitle => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
    height: 1.1,
  );

  static TextStyle get registerTitle => TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
    height: 1.1,
  );
  static TextStyle get crete_account => TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
    height: 1.1,
  );
  static TextStyle get loginSubtitle =>
      TextStyle(fontSize: 15.sp, color: AppColors.gray2);

  static TextStyle get registerSubtitle => TextStyle(
    fontSize: 14.sp,
    color: AppColors.white.withOpacity(0.55),
    height: 1.35,
  );
  static TextStyle get loginLabel => TextStyle(
    fontSize: 14.5.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle get registerLabel => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle get labelStyle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
    color: AppColors.whiteOpacity60,
  );
  static TextStyle get loginButton => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
  static TextStyle get registerButton => TextStyle(
    fontSize: 14.5.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );
  static TextStyle get link => TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static TextStyle get movieTitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: AppColors.whiteOpacity90,
  );
  static TextStyle timeLabel = const TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle get movieSubtitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteOpacity60,
  );
  static TextStyle get sectionTitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle get heading => TextStyle(
    fontFamily: fontFamily,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle get usernametext => TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle get emailtext => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    color: AppColors.whiteemail,
  );

  static TextStyle get title_item_prfile => TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    letterSpacing: 0.5,
  );

  static TextStyle get logout_text => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle get bodyText => TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle get bodyText2 => TextStyle(
    fontFamily: secondaryFont,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle get subtitle => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.ssd,
  );

  static TextStyle get caption => TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get footer =>
      TextStyle(fontSize: 12.5.sp, color: AppColors.white.withOpacity(0.55));

  static TextStyle get text_divider =>
      TextStyle(fontSize: 12.sp, color: AppColors.white.withOpacity(0.55));

  static TextStyle get social_text => TextStyle(
    color: AppColors.white,
    fontSize: 13.5.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get text_span1 =>
      TextStyle(fontSize: 15.sp, color: AppColors.gray2);

  static TextStyle get text_span2 => TextStyle(
    fontSize: 15.sp,
    color: AppColors.primary,
    fontWeight: FontWeight.w800,
  );
}

class AppRadius {
  static double get defaultRadius => 4.0.r;
  static double get lg => 8.0.r;
  static double get xl => 16.0.r;
  static double get x2 => 20.0.r;
  static double get full => 9999.0.r;
}
