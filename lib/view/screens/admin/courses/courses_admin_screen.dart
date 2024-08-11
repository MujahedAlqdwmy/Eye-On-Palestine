import 'package:eye_on_palestine/view/widgets/admin/courses/courses_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/courses/courses_admin_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/home/custom_app_bar.dart';

class CoursesAdminScreen extends StatelessWidget {
  const CoursesAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoursesAdminControllerImp(), permanent: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Courses".tr),
        body: const CoursesAdmin(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
