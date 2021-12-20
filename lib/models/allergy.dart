class Allergy {
  final String id;
  final String allergy;
  final bool isSelected;

  Allergy({
    required this.allergy,
    required this.id,
    this.isSelected = false,
  });
}
