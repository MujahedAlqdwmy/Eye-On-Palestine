import 'package:eye_on_palestine/view/widgets/admin/events/add_event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/events/add_event_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/home/custom_app_bar.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddEventControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Add Event".tr),
        body: const AddEvent(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
