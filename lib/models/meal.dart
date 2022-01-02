class Meal {
  final String id;
  final String title;
  bool isSelected;
  final String imgPath;
  final bool? breakFast;
  final bool? lunch;
  final bool? supper;

  Meal({
    required this.id,
    required this.title,
    required this.imgPath,
    this.breakFast,
    this.lunch,
    this.supper,
    this.isSelected = false,
  });
}
