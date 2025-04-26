class Outfit {
  final String id;
  final String imageUrl;
  final List<String> tags;
  final String? bodyShape;
  final String? preferredColor;
  final List<String> preferredColors;

  Outfit({
    required this.id,
    required this.imageUrl,
    required this.tags,
    this.bodyShape,
    this.preferredColor,
    required this.preferredColors,
  });
}