import 'package:eye_on_palestine/view/widgets/admin/courses/update_delete_course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/courses/update_delete_course_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/home/custom_app_bar.dart';

class UpdateDeleteCourseScreen extends StatelessWidget {
  const UpdateDeleteCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateDeleteCourseControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Update Or Delete Course".tr),
        body: const UpdateDeleteCourse(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
