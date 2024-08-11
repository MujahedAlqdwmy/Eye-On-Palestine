import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:eye_on_palestine/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controller/location_controller.dart';
import 'custom_text_distance.dart';
import '../custom_title_body_section.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationControllerImp());
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(),
          CustomTitleAndBodySection(
            title: 'title of location'.tr,
            body: "introduction location screen".tr,
          ),
          GetBuilder<LocationControllerImp>(builder: (controller) {
            return Column(
              children: [
                controller.isLoading == null
                    ? const SizedBox()
                    : (controller.isLoading == true
                        ? LottieBuilder.asset(
                            AppImages.loadingLottie,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Column(
                            children: [
                              SizedBox(
                                width: Get.width,
                                height: 200,
                                child: GoogleMap(
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: true,
                                  zoomGesturesEnabled: true,
                                  initialCameraPosition: CameraPosition(
                                    //innital position in map
                                    target: LatLng(
                                      controller.position!.latitude,
                                      controller.position!.longitude,
                                    ), //initial position
                                    zoom: 16.0, //initial zoom level
                                  ),
                                  markers: controller.markers,
                                  mapType: MapType.hybrid,
                                  polylines: Set<Polyline>.of(
                                      controller.polylines.values),
                                  onMapCreated: (c) {
                                    controller.mapController = c;
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              CustomTextDistance(
                                distance: controller.currentDistance!,
                              ),
                            ],
                          )),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    controller.getLocation();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  icon: const Icon(Icons.location_on_outlined),
                  label: Text("Get your location".tr),
                ),
                const SizedBox(height: 80),
              ],
            );
          }),
        ],
      ),
    );
  }
}
