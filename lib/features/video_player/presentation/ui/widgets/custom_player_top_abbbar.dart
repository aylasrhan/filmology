
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/video_player/presentation/ui/widgets/custom_glasscircle_button.dart';

class PlayerTopAppBar extends StatelessWidget {
  const PlayerTopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           GlassIconButton(icon: Icons.keyboard_arrow_down,onPressed: (){  
 context.pop();   
  },),
          
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "THE BATMAN",
                style: AppTextStyles.movieTitle.copyWith(
                  letterSpacing: 2.w, 
                  fontSize: 18.sp,
                ),
              ),
              Text(
                "Official Trailer 2",
                style: AppTextStyles.movieSubtitle.copyWith(
                  fontSize: 14.sp, 
                ),
              
              ),
            ],
          ),
          
           GlassIconButton(icon: Icons.cast, onPressed: (){},),
        ],
      ),
    );
  }
}