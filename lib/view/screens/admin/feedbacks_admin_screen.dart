import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/feedbacks_admin_controller.dart';
import '../../widgets/admin/feedbacks/feedbacks_admin.dart';
import '../../widgets/home/custom_app_bar.dart';

class FeedBacksAdminScreen extends StatelessWidget {
  const FeedBacksAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FeedbacksAdminControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Feedbacks".tr),
        body: const FeedBacksAdmin(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
