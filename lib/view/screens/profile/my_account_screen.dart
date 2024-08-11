import 'package:eye_on_palestine/controller/profile/my_account_controller.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_app_bar.dart';
import 'package:eye_on_palestine/view/widgets/home/profile/my_account/my_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyAccountControllerImp());
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: customAppBar(title: "My Account".tr),
      body: const MyAccount(),
    ));
  }
}
