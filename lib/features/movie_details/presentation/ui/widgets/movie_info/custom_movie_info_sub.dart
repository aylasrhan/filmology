import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:filmology/core/styles/text_style.dart';
import 'package:filmology/features/movie_details/presentation/ui/widgets/custom_cast_item.dart';


class CastSection extends StatelessWidget {
  final bool isMobile;

  const CastSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Text(
            'Cast',
            style: AppTextStyles.heading.copyWith(
              fontSize: isMobile ? 27.sp : 25.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20), 
        SizedBox(
          height: isMobile ? 175.h :200.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _buildCastItems(isMobile),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCastItems(bool isMobile) {
    final castData = [
      {'name': 'Matthew McC.', 'image': 'assets/images/cast1.png'},
      {'name': 'Anne H.', 'image': 'assets/images/cast2.png'},
      {'name': 'Jessica C.', 'image': 'assets/images/cast1.png'},
      {'name': 'Mackenzie F.', 'image': 'assets/images/cast2.png'},
    ];

    return castData.asMap().entries.map((entry) {
      int idx = entry.key;
      var data = entry.value;

      return Row(
        children: [
          if (idx == 0) SizedBox(width: isMobile ? 0 : 16),
          
          CastItemWidget(
            name: data['name']!,
            imageUrl: data['image']!,
            size: isMobile ? 100.r : 110.r,
          ),
          
          SizedBox(width: isMobile ? 15 : 21),
          
          if (idx == castData.length - 1) SizedBox(width: isMobile ? 0 : 16),
        ],
      );
    }).toList();
  }
}