import 'package:eye_on_palestine/controller/courses/course_episods_conreoller.dart';
import 'package:eye_on_palestine/data/models/episode_model.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

abstract class EpisodeController extends GetxController {}

class EpisodeControllerImp extends EpisodeController {
  late EpisodeModel selectedEpisode;
  late YoutubePlayerController youtubePlayerController;
  late YoutubePlayerController youtubePlayerController2;

  @override
  void onInit() async {
    selectedEpisode = Get.arguments;
    final CourseEpisodsControllerImp controllerImp = Get.find();
    String? videoId =
        YoutubePlayerController.convertUrlToId(selectedEpisode.url);
    youtubePlayerController = YoutubePlayerController.fromVideoId(
      videoId: videoId!,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    double duration = 0;
    double currentTime = 0;
    bool isFirst = false;
    youtubePlayerController.listen(
      (event) async {
        duration =
            duration == 0 ? await youtubePlayerController.duration : duration;
        currentTime =
            !isFirst ? await youtubePlayerController.currentTime : currentTime;
        if (duration != 0 && !isFirst && duration - 15 <= currentTime) {
          controllerImp.whenEndEpisode(selectedEpisode);
          isFirst = true;
        }
      },
    );
    super.onInit();
  }

  @override
  void dispose() {
    youtubePlayerController.close();
    super.dispose();
  }
}
