import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; 
import 'package:filmology/core/di/service_locator.dart';
import 'package:filmology/core/routing/routes_names.dart';
import 'package:filmology/core/services/auth_storage_service.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/splash/presentation/ui/widgets/custom_splash_footer.dart';
import 'package:filmology/features/splash/presentation/ui/widgets/custom_splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      final bool hasToken = await getIt<AuthStorageService>().hasToken();

      if (mounted) {
        context.go(hasToken ? Routes.home : Routes.register);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarkSplash,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SplashLogo(),
                const SizedBox(height: 24),
                Text('MovieReview', style: AppTextStyles.splashTitle),
                const SizedBox(height: 8),
                Text(
                  'SHARE YOUR PERSPECTIVE',
                  style: AppTextStyles.splashSubtitle,
                ),
              ],
            ),
          ),
          const SplashFooter(),
        ],
      ),
    );
  }
}
