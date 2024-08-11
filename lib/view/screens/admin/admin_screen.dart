import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/admin_controller.dart';
import '../../widgets/admin/admin.dart';
import '../../widgets/admin/custom_drawer_admin.dart';
import '../../widgets/home/custom_app_bar.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AdminControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        drawer: const CustomDrawerAdmin(),
        appBar: customAppBar(title: "Admin".tr),
        body: const Admin(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
