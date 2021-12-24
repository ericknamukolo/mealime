class Meal {
  final String id;
  final String title;
  final int duration;
  final String imgPath;
  final int servings;
  final List<String> ingredients;
  final List<String> instructions;
  Meal({
    required this.id,
    required this.title,
    required this.duration,
    required this.imgPath,
    required this.servings,
    required this.ingredients,
    required this.instructions,
  });
}
