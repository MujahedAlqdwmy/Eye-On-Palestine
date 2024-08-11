import 'package:eye_on_palestine/view/widgets/home/custom_button_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/admin/events/events_admin_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class EventsAdmin extends GetView<EventsAdminControllerImp> {
  const EventsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          children: [
            Text(
              'Upper text events admin'.tr,
              style: const TextStyle(
                color: AppColor.textColorRed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GetBuilder<EventsAdminControllerImp>(
              builder: (controller) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: controller.events.length,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              controller.goToUpdateOrDeleteEvent(
                                  controller.events[index]);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(AppImages.rectangleDecoration),
                                ),
                              ),
                              child: Text(
                                controller.events[index].date,
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
            const SizedBox(height: 20),
            CustomButtonSmall(
              text: "Add new one".tr,
              onPressed: () {
                controller.goToAddEvents();
              },
            ),
          ],
        ),
      ),
    );
  }
}
