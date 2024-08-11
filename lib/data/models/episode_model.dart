class EpisodeModel {
  final String id;
  final String title;
  final String titleAr;
  final String description;
  final String descriptionAr;
  bool checkComplete;
  final String url;

  EpisodeModel({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.description,
    required this.descriptionAr,
    this.checkComplete = false,
    required this.url,
  });
}
