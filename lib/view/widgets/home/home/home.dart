import 'package:eye_on_palestine/controller/home_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/view/widgets/home/home/box_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/translation_data.dart';

class Home extends GetView<HomeControllerImp> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              translationData(
                en: AppImages.logoEn,
                ar: AppImages.logoAr,
              ),
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 20),
            Text(
              "introduction home screen".tr,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 16,
                height: 1.3,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.boxes.length - 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 1.25,
              ),
              itemBuilder: (ctx, index) {
                final box = controller.boxes[index];
                return BoxHome(
                  title: box.title.tr,
                  image: box.image,
                  onTap: () {
                    controller.changePage(index + 3);
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            BoxHome(
              title: controller.boxes[2].title.tr,
              image: controller.boxes[2].image,
              onTap: () {
                controller.changePage(5);
              },
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
