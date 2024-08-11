import 'package:eye_on_palestine/controller/home_controller.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/view/widgets/home/drawer/custom_list_tile_drawer.dart';
import 'package:eye_on_palestine/view/widgets/home/drawer/custom_list_tile_prfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../controller/drawer_controller.dart';
import '../../../../core/constants/app_colors.dart';

class CustomDrawer extends GetView<HomeControllerImp> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp drawerControllerImp = Get.put(DrawerControllerImp());
    return Drawer(
      backgroundColor: AppColor.gradientColor1,
      child: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(
              color: AppColor.gradientColor2,
            ),
            child: GetBuilder<DrawerControllerImp>(builder: (controller) {
              return CustomListTileProfile(
                name: controller.name,
                imageUrl: controller.imageUrl,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.starIcon,
                    width: 22,
                    height: 22,
                  ),
                  title: "The Whole Story".tr,
                  onTap: () {
                    Get.back();
                    controller.changePage(3);
                  },
                ),
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.calendarIcon,
                    width: 22,
                    height: 22,
                  ),
                  title: "Events".tr,
                  onTap: () {
                    Get.back();
                    controller.changePage(4);
                  },
                ),
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.crownIcon,
                    width: 22,
                    height: 22,
                  ),
                  title: "Hashemite".tr,
                  onTap: () {
                    Get.back();
                    controller.changePage(5);
                  },
                ),
                const SizedBox(height: 30),
                const Divider(
                  color: AppColor.white,
                  thickness: 2,
                ),
                const SizedBox(height: 30),
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.userIcon,
                    color: AppColor.gold,
                    width: 20,
                    height: 20,
                  ),
                  title: "My Profile".tr,
                  onTap: () {
                    Get.back();
                    controller.changePage(6);
                  },
                ),
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.aboutUsIcon,
                    width: 22,
                    height: 22,
                    color: AppColor.gold,
                  ),
                  title: "About Us".tr,
                  onTap: () {
                    Get.back();
                    controller.changePage(7);
                  },
                ),
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.feedback,
                    width: 22,
                    height: 22,
                    color: AppColor.gold,
                  ),
                  title: "Feedback".tr,
                  onTap: () {
                    Get.back();
                    controller.changePage(8);
                  },
                ),
                // GetBuilder<DrawerControllerImp>(
                //   builder: (controller) {
                //     return CustomeSwitchListTile(
                //       title: "Dark mode",
                //       onTap: () {
                //         controller.changeMode();
                //       },
                //       onChangedSwitch: (_) {
                //         controller.changeMode();
                //       },
                //       switchvalue: controller.isDarkmode,
                //     );
                //   },
                // ),
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.logoutIcon,
                    width: 22,
                    height: 22,
                  ),
                  title: "Logout".tr,
                  onTap: () {
                    drawerControllerImp.logout();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
