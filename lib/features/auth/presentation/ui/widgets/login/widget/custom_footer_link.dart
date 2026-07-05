
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/login/widget/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePass = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email Address", style: AppTextStyles.loginLabel),
          SizedBox(height: 8.h),
          LoginTextField(
            controller: _emailController,
            hintText: "name@example.com",
            icon: Icons.mail,
            validator: (v) =>
                (v == null || v.isEmpty) ? "Email is required" : null,
          ),
          SizedBox(height: 16.h),
          Text("Password", style: AppTextStyles.loginLabel),
          SizedBox(height: 8.h),
          LoginTextField(
            controller: _passwordController,
            hintText: "Enter your password",
            icon: Icons.lock,
            obscureText: _hidePass,
            suffix: IconButton(
              icon: Icon(
                _hidePass ? Icons.visibility_off : Icons.visibility,
                color: AppColors.gray2,
                size: 20.sp,
              ),
              onPressed: () => setState(() => _hidePass = !_hidePass),
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? "Password is required" : null,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text("Forgot Password?", style: AppTextStyles.link),
            ),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                elevation: 0,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().login(
                    email: _emailController.text.trim(),
                    password: _passwordController.text,
                  );
                }
              },
              child: Text("Log In", style: AppTextStyles.loginButton),
            ),
          ),
        ],
      ),
    );
  }
}