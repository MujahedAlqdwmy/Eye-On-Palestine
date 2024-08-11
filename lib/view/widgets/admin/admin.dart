import 'package:eye_on_palestine/view/widgets/admin/custom_box_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/admin/admin_controller.dart';

class Admin extends GetView<AdminControllerImp> {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Container(
          alignment: Alignment.center,
          height: 600,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.boxes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  controller.boxesFunction[index]();
                },
                child: CustomBoxAdmin(text: controller.boxes[index].tr),
              );
            },
          ),
        ),
      ),
    );
  }
}
