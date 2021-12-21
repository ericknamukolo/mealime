class Grocery {
  final String id;
  final String ingredient;
  final String quantity;
  final bool isChecked;

  Grocery({
    required this.id,
    required this.ingredient,
    required this.quantity,
    this.isChecked = false,
  });
}
