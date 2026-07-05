import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/routing/routes_names.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_state.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_auth_social.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/form/custom_form.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_register_background.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_footer_link.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_header.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        passwordConfirmation: _confirmController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading)
          EasyLoading.show();
        else if (state is AuthSuccess) {
          EasyLoading.dismiss();
          context.go(Routes.login);
        } else if (state is AuthError) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.errMessage);
        }
      },
      child: Scaffold(
        body: RegisterBackground(
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400.w),
                  child: Column(
                    children: [
                      const RegisterHeader(),
                      RegisterForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmController: _confirmController,
                        onRegister: _handleRegister,
                      ),
                      const SocialAuthSection(),
                      const FooterLink(
                        normalText: "Already have an account? ",
                        linkText: "Log in",
                        routeName: Routes.login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
