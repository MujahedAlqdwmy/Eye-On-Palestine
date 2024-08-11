import 'package:eye_on_palestine/view/widgets/admin/courses/add_episode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/courses/add_episode_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/home/custom_app_bar.dart';

class AddEpisodeScreen extends StatelessWidget {
  const AddEpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEpisodeControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Add Episode".tr),
        body: const AddEpisode(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
