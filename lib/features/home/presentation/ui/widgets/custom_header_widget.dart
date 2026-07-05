import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmology/core/styles/colors/color.dart';
import 'package:filmology/features/home/presentation/ui/widgets/custom_header_greeting.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const HeaderGreetingsSection(), const UserProfileAvatar()],
      ),
    );
  }
}

class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({super.key});
  @override
  Widget build(BuildContext context) {
    const String imageUrl =
        "https://lh3.googleusercontent.com/aida-public/AB6AXuDE3RVQeRQaI3dD6B3NOF_4A7xZ2zAEIr8ecnTiT8tGJsCIaYCEEP6MQce4bQFNjhftp6PSXFKdJ-7luTki1BsAgkHlohC35CpVRZ_g93_7nlvRDZCVCkdtSHY5cCuAKMAXt0jcyJqRGzj2ir4XR2OU4AVeIZlEmyT1CmhgGQ2nS67v69rQyqVxPDaPnqck2rTcqUO6Nk880hJXSihXNFWGgf_esS7sKoIo2wym1kgcCpPTGv5Vy5FjEzkJcamWlbndVhJ8WIz505Eg";
    return Container(
      width: 44.r,
      height: 44.r,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      alignment: Alignment.center,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 40.r,
          height: 40.r,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey[900],
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: AppColors.surface,
            child: Icon(Icons.person, color: Colors.white, size: 24.sp),
          ),
        ),
      ),
    );
  }
}
