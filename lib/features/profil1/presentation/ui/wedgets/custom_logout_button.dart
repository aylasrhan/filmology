
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/di/service_locator.dart';
import 'package:filmology/core/routing/routes_names.dart';
import 'package:filmology/core/services/auth_storage_service.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.logoutbuttoncolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: AppColors.backgroundbulidprofileitem,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.logout_rounded,
                        color: AppColors.logoutbuttoncolor,
                        size: 50,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Sign Out",
                        style: AppTextStyles.title_item_prfile.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Are you sure you want to log out of your account?",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.logout_text.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  actionsAlignment: MainAxisAlignment.spaceEvenly,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.logout_text,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.logoutbuttoncolor,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
onPressed: () async {
  final AuthStorageService storageService = getIt<AuthStorageService>();

  await storageService.clearAllData();

  if (context.mounted) {
    Navigator.pop(context);

    context.go(Routes.login); 
  }
  print("✅ User logged out successfully and redirected to Login");
},
                      child: Text(
                        "Logout",
                        style: AppTextStyles.logout_text,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            'Logout',
            style: AppTextStyles.logout_text,
          ),
        ),
      ),
    );
  }
}