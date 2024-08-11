import 'package:eye_on_palestine/controller/admin/courses/update_delete_episode_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../widgets/admin/courses/update_delete_episode.dart';
import '../../../widgets/home/custom_app_bar.dart';

class UpdateDeleteEpisodeScreen extends StatelessWidget {
  const UpdateDeleteEpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateDeleteEpisodeControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Update Or Delete Episode".tr),
        body: const UpdateDeleteEpisode(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
