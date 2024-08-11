import 'package:eye_on_palestine/controller/profile/profile_controller.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/custom_button_profile.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/heading_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';

class Profile extends GetView<ProfileControllerImp> {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: Get.height / 20),
            const HeadingProfile(),
            const SizedBox(height: 50),
            CustomButtonProfile(
              text: "My Account".tr,
              leading: const Icon(Icons.person_outline),
              onPressed: () {
                controller.goToMyAccount();
              },
            ),
            const SizedBox(height: 10),
            CustomButtonProfile(
              text: "My Courses".tr,
              leading: SvgPicture.asset(
                AppImages.coursesIcon,
                color: AppColor.white,
                width: 22,
                height: 22,
              ),
              onPressed: () {
                controller.goToMyCourses();
              },
            ),
          ],
        ),
      ),
    );
  }
}
