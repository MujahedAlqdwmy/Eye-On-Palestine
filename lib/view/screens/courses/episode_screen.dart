import 'package:eye_on_palestine/controller/courses/episode_controller.dart';
import 'package:eye_on_palestine/core/functions/translation_data.dart';
import 'package:eye_on_palestine/view/widgets/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../core/constants/app_colors.dart';
import '../../widgets/home/courses/episode.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EpisodeControllerImp controller = Get.put(EpisodeControllerImp());
    return YoutubePlayerScaffold(
        controller: controller.youtubePlayerController,
        aspectRatio: 16 / 9,
        builder: (ctx, player) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.bgColor,
              appBar: customAppBar(
                  title: translationData(
                en: controller.selectedEpisode.title,
                ar: controller.selectedEpisode.titleAr,
              )),
              body: Episode(player: player),
            ),
          );
        });
  }
}
