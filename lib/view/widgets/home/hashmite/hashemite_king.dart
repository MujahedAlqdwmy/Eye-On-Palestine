import 'package:cached_network_image/cached_network_image.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/hashemite/hashemite_king_controller.dart';
import '../../../../core/constants/app_colors.dart';

class HashemiteKing extends GetView<HashemiteKingControllerImp> {
  const HashemiteKing({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            Row(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 4,
                  color: AppColor.textColorRed,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: controller.selectedAchievement.imageUrl,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                translationData(
                  en: controller.selectedAchievement.content,
                  ar: controller.selectedAchievement.contentAr,
                ),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: AppColor.textColorRed,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
