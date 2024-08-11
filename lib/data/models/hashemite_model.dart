class HashemiteModel {
  final String id;
  final String nameOfKing;
  final String nameOfKingAr;
  final String content;
  final String contentAr;
  final String imageUrl;
  double? order;

  HashemiteModel({
    required this.id,
    required this.nameOfKing,
    required this.nameOfKingAr,
    required this.content,
    required this.contentAr,
    required this.imageUrl,
    this.order,
  });
}
