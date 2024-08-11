import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            Row(),
            SvgPicture.asset(AppImages.aboutUsImage),
            const SizedBox(height: 50),
            Text(
              'about us 1'.tr,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 16,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'about us 2'.tr,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 16,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'about us 3'.tr,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 16,
                height: 1.7,
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
