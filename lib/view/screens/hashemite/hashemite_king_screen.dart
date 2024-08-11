import 'package:eye_on_palestine/controller/hashemite/hashemite_king_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/home/hashmite/hashemite_king.dart';

class HashemiteKingScreen extends GetView<HashemiteKingControllerImp> {
  const HashemiteKingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HashemiteKingControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: customAppBar(
          title: translationData(
        en: controller.selectedAchievement.nameOfKing,
        ar: controller.selectedAchievement.nameOfKingAr,
      )),
      body: const HashemiteKing(),
    ));
  }
}
