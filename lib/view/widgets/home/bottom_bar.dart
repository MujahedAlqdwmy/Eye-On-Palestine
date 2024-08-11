import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constants/app_images.dart';
import 'custom_icon_bottom_bar.dart';

class BottomBar extends GetView<HomeControllerImp> {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: Get.width,
      bottom: 0,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.only(top: 10),
              height: 60,
              color: AppColor.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.iconListBottomBar.length,
                  (index) => Row(
                    children: [
                      CustomIconBottomBra(
                        icon: controller.iconListBottomBar[index],
                        textIcon: controller.textIconListBottomBar[index].tr,
                        onTap: () {
                          controller.changePage(index);
                        },
                      ),
                      index == 2 ? const SizedBox() : const SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: Get.width,
            child: Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.bottomDecorLeft,
                  scale: 1.3,
                ),
                Image.asset(
                  AppImages.bottomDecorRight,
                  scale: 1.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
