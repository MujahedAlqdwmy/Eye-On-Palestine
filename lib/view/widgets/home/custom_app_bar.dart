import 'package:eye_on_palestine/core/localization/locale_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/functions/dialog_change_language.dart';

AppBar customAppBar({required String title}) {
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
  );
}
