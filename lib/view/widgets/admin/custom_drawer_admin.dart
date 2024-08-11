import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/view/widgets/home/drawer/custom_list_tile_drawer.dart';
import 'package:eye_on_palestine/view/widgets/home/drawer/custom_list_tile_prfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../controller/drawer_controller.dart';
import '../../../../core/constants/app_colors.dart';

class CustomDrawerAdmin extends GetView<DrawerControllerImp> {
  const CustomDrawerAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DrawerControllerImp());
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
            child: CustomListTileProfile(
              name: controller.name,
              imageUrl: controller.imageUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                CustomListTileDrawer(
                  leading: SvgPicture.asset(
                    AppImages.logoutIcon,
                    width: 22,
                    height: 22,
                  ),
                  title: "Logout".tr,
                  onTap: () async {
                    controller.logout();
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
