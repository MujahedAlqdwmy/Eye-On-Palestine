import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/hashemite/hashemite_admin_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/admin/hashemite/hashemite_admin.dart';
import '../../../widgets/home/custom_app_bar.dart';

class HashemiteAdminScreen extends StatelessWidget {
  const HashemiteAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HashemiteAdminControllerImp(), permanent: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Hashemite".tr),
        body: const HashemiteAdmin(),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
