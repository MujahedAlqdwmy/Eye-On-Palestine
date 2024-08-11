import 'package:eye_on_palestine/controller/admin/events/events_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../widgets/admin/events/events_admin.dart';
import '../../../widgets/home/custom_app_bar.dart';

class EventsAdminScreen extends StatelessWidget {
  const EventsAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EventsAdminControllerImp(), permanent: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Events".tr),
        body: const EventsAdmin(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
