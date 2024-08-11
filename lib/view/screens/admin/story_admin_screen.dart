import 'package:eye_on_palestine/controller/admin/story_admin_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/view/widgets/admin/story_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/home/custom_app_bar.dart';

class StoryAdminScreen extends StatelessWidget {
  const StoryAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StoryAdminControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "The Whole Story".tr),
        body: const StoryAdmin(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
