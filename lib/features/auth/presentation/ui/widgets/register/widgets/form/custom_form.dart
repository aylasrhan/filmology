
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/custom_text_field.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/form/custom_form_validators.dart';
import 'package:filmology/features/auth/presentation/ui/widgets/register/widgets/form/custom_register_button.dart';


class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController, emailController, passwordController, confirmController;
  final VoidCallback onRegister;

  const RegisterForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmController,
    required this.onRegister,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _hidePass = true;
  bool _hideConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel("Name"),
          RegisterTextField(
            controller: widget.nameController,
            hint: "Your full name",
            icon: Icons.person,
            validator: FormValidators.validateName,
          ),
          SizedBox(height: 16.h),

          _buildLabel("Email"),
          RegisterTextField(
            controller: widget.emailController,
            hint: "name@example.com",
            icon: Icons.email,
            validator: FormValidators.validateEmail,
          ),
          SizedBox(height: 16.h),

          _buildLabel("Password"),
          RegisterTextField(
            controller: widget.passwordController,
            hint: "••••••••",
            icon: Icons.lock,
            obscure: _hidePass,
            validator: FormValidators.validatePassword,
            suffix: _buildVisibilityIcon(_hidePass, () => setState(() => _hidePass = !_hidePass)),
          ),
          SizedBox(height: 16.h),

          _buildLabel("Confirm Password"),
          RegisterTextField(
            controller: widget.confirmController,
            hint: "••••••••",
            icon: Icons.lock_reset,
            obscure: _hideConfirm,
            validator: (value) => FormValidators.validateConfirmPassword(value, widget.passwordController.text),
            suffix: _buildVisibilityIcon(_hideConfirm, () => setState(() => _hideConfirm = !_hideConfirm)),
          ),
          SizedBox(height: 32.h),

          RegisterButton(onPressed: widget.onRegister),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(text, style: AppTextStyles.registerLabel),
    );
  }

  Widget _buildVisibilityIcon(bool isHidden, VoidCallback onTap) {
    return IconButton(
      icon: Icon(
        isHidden ? Icons.visibility_off : Icons.visibility,
        color: AppColors.gray2,
      ),
      onPressed: onTap,
    );
  }
}