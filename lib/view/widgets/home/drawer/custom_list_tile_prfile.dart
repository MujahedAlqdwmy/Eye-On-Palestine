import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class CustomListTileProfile extends StatelessWidget {
  final String name;
  final String? imageUrl;
  const CustomListTileProfile({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundColor: imageUrl != null ? null : AppColor.white,
        backgroundImage:
            imageUrl == null ? null : CachedNetworkImageProvider(imageUrl!),
        child: imageUrl != null
            ? null
            : SvgPicture.asset(
                AppImages.userIcon,
                width: 30,
                height: 30,
                color: AppColor.iconColor,
              ),
      ),
      title: FittedBox(
        child: Text(
          "Hi,".tr + name,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(
        'Welcome back'.tr,
        style: const TextStyle(
          color: AppColor.white,
        ),
      ),
    );
  }
}
