import 'package:eye_on_palestine/view/widgets/admin/hashemite/add_king.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/hashemite/add_king_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../widgets/home/custom_app_bar.dart';

class AddKingScreen extends StatelessWidget {
  const AddKingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddKingControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        appBar: customAppBar(title: "Add Achievement".tr),
        body: const AddKing(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
