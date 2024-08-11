import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/functions/dialog_change_language.dart';

AppBar customAppBarMyCourses({required String title}) {
  LocaleController controller = Get.find();
  return AppBar(
    //centerTitle: true,
    title: Text(title),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.gradientColor1,
            AppColor.gradientColor2,
          ],
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          dialogChangeLanguage(controller);
        },
        icon: const Icon(
          Icons.language,
        ),
      )
    ],
    bottom: TabBar(
      labelColor: Colors.white,
      isScrollable: true,
      tabs: [
        Tab(
          icon: SvgPicture.asset(
            AppImages.coursesIcon,
            color: Colors.grey,
            width: 25,
            height: 25,
          ),
          text: 'My Courses'.tr,
        ),
        Tab(
          icon: const Icon(Icons.favorite),
          text: 'My Favorites'.tr,
        ),
        Tab(
          icon: const Icon(Icons.check),
          text: 'Completed Courses'.tr,
        ),
      ],
    ),
  );
}
