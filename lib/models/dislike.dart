class Dislike {
  final String id;
  final String dislike;
  final bool isSelected;

  Dislike({
    required this.dislike,
    required this.id,
    this.isSelected = false,
  });
}
