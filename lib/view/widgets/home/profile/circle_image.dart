import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class CircleImage extends StatelessWidget {
  final XFile? image;
  const CircleImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundImage: image != null ? FileImage(File(image!.path)) : null,
      backgroundColor: AppColor.white,
      child: image == null
          ? SvgPicture.asset(
              AppImages.userIcon,
              width: 60,
              height: 60,
              color: AppColor.iconColor,
            )
          : null,
    );
  }
}
