import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/routing/routes_names.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_state.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/login/widget/custom_footer_link.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/login/widget/custom_header.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/login/widget/custom_section_divider.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/login/widget/custom_social_button.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_footer_link.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_section_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading)
          EasyLoading.show(status: 'Logging in...');
        else if (state is AuthSuccess) {
          EasyLoading.dismiss();
          context.go(Routes.home);
        } else if (state is AuthError) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.errMessage);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginHeader(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      LoginWelcomeSection(),
                      SizedBox(height: 30.h),
                      LoginForm(),
                      SectionDivider(text: "Or continue with"),
                      SizedBox(height: 20.h),
                      SocialLoginSection(),
                      SizedBox(height: 30.h),
                      FooterLink(
                        normalText: "Don't have an account? ",
                        linkText: "Sign Up",
                        routeName: Routes.register,
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}