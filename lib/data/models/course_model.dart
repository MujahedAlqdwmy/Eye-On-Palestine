import 'episode_model.dart';

class CourseModel {
  final String id;
  final String title;
  final String titleAr;
  final String description;
  final String descriptionAr;
  int numOfParticipants;
  final double duration;
  final int numOfEpisodes;
  int numOfFavorites;
  final List<EpisodeModel> episodes;
  bool isFavorite;

  CourseModel({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.description,
    required this.descriptionAr,
    required this.numOfParticipants,
    required this.duration,
    required this.numOfEpisodes,
    required this.episodes,
    required this.numOfFavorites,
    this.isFavorite = false,
  });
}
