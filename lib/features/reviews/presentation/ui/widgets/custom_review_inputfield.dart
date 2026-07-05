import 'package:flutter/material.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/core/styles/text_style.dart';

class ReviewInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;

  const ReviewInputField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      
      decoration: BoxDecoration(
        color: AppColors.whiteOpacity5,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.whiteOpacity1),
        boxShadow: [
      BoxShadow(
        color: AppColors.white.withOpacity(0.07), 
        blurRadius: 20,
        spreadRadius: 5,
        offset: const Offset(0, 10), 
      ),
    ],
      ),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            maxLines: null,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              height: 1.5,
            ),
            decoration: const InputDecoration(
              
              hintText: "Share your thoughts on the movie...what did you like?",
              hintStyle: TextStyle(color: AppColors.white24),
              border: InputBorder.none,
              
            ),
          
            onChanged: (_) => onChanged(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              "${controller.text.length} / 500",
              style: AppTextStyles.caption.copyWith(
                color: AppColors.white24,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
