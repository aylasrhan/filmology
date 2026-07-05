
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import '../../../../../core/styles/colors/color.dart';
import '../../../../../core/styles/text_style.dart'; 

class CastItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl; 
  final double size;

  const CastItemWidget({
    super.key,
    required this.name,
    required this.imageUrl,
    this.size = 70,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = size * 0.15;

    return Column(
      
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.white.withOpacity(0.1),
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage(imageUrl), 
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: size + 10.w,
          child: Text(
            name,
            style: TextStyle(
              fontFamily: AppTextStyles.fontFamily,
              color: AppColors.white,
              fontSize: fontSize.sp, 
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}