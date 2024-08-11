import 'package:eye_on_palestine/controller/admin/hashemite/update_delete_king_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../widgets/admin/hashemite/update_delete_king.dart';
import '../../../widgets/home/custom_app_bar.dart';

class UpdateDeleteKingScreen extends StatelessWidget {
  const UpdateDeleteKingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateDeleteKingControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Update Or Delete Achievement".tr),
        body: const UpdateDeleteKing(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
