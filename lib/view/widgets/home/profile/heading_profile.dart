import 'package:eye_on_palestine/controller/profile/profile_controller.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class HeadingProfile extends StatelessWidget{
  const HeadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(builder: (controller) {
      return Column(
        children: [
          controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : CircleImage(image: controller.image),
          const SizedBox(height: 5),
          Text(
            controller.userName,
            style: const TextStyle(
              color: AppColor.textColorRed,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            controller.email,
            style: const TextStyle(
              color: AppColor.textField,
              fontSize: 12,
            ),
          ),
        ],
      );
    });
  }
}
