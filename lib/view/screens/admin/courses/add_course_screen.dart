import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/courses/add_course_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/admin/courses/add_course.dart';
import '../../../widgets/home/custom_app_bar.dart';

class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddCourseControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Add Course".tr),
        body: const AddCourse(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
