import 'package:eye_on_palestine/controller/home_controller.dart';
import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/bottom_bar.dart';
import '../widgets/home/custom_app_bar.dart';
import '../widgets/home/drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return SafeArea(
        child: WillPopScope(
          onWillPop: () {
            controller.backPage();
            return Future.value(false);
          },
          child: Scaffold(
            onDrawerChanged: (val) {
              controller.deleteDrawer(val);
            },
            backgroundColor: AppColor.bgColor,
            appBar: customAppBar(
                title: controller.pageName[controller.currentIndex].tr),
            drawer: const CustomDrawer(),
            body: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                await controller.onRefresh();
              },
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    controller.page[controller.currentIndex],
                    const BottomBar(),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
          ),
        ),
      );
    });
  }
}
