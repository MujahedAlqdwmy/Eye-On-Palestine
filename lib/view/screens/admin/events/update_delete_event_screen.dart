import 'package:eye_on_palestine/view/widgets/admin/events/update_delete_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/events/update_delete_event_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/home/custom_app_bar.dart';

class UpdateDeleteEventScreen extends StatelessWidget {
  const UpdateDeleteEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateDeleteEventControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Update Or Delete Event".tr),
        body: const UpdateDeleteEvent(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
