
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/styles/text_style.dart';

class FooterLink extends StatelessWidget {
  final String normalText;
  final String linkText;
  final String routeName;

  const FooterLink({
    super.key,
    required this.normalText,
    required this.linkText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: AppTextStyles.footer,
            children: [
              TextSpan(text: normalText),
              TextSpan(
                text: linkText,
                style: AppTextStyles.text_span2,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => context.push(routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}