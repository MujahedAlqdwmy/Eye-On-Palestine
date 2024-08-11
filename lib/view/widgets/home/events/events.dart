import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/events_conroller.dart';
import '../custom_button_small.dart';
import '../custom_title_body_section.dart';
import 'event_details.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventsControllerImp>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          controller: controller.scrollController,
          children: [
            const SizedBox(height: 16),
            CustomTitleAndBodySection(
              title: "Events over Years".tr,
              body: "introduction events screen".tr,
            ),
            controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: controller.events.length,
                    //controller.events[index].date,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.changeEvent(controller.events[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.rectangleDecoration),
                            ),
                          ),
                          child: Text(
                            controller.events[index].date,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      );
                    },
                  ),
            controller.currentEvent != null
                ? Column(
                  children: [
                    EventDetails(
                      content: translationData(
                        en: controller.currentEvent!.content,
                        ar: controller.currentEvent!.contentAr,
                      ),
                      date: controller.currentEvent!.date,
                      imageUrl: controller.currentEvent!.imageUrl,
                      areaOfIsrael: controller.currentEvent!.areaOfIsrael,
                      areaOfPalestine:
                          controller.currentEvent!.areaOfPalestine,
                    ),
                    const SizedBox(height: 20),
                    CustomButtonSmall(
                      text: 'Back to up'.tr,
                      onPressed: () {
                        controller.backToUp();
                      },
                    ),
                  ],
                )
                : const SizedBox(),
            const SizedBox(height: 76), // to padding from bottom
          ],
        ),
      );
    });
  }
}
