class Serving {
  final String id;
  final String description;
  final int numOfServing;
  final bool isSelected;

  Serving({
    required this.description,
    required this.numOfServing,
    required this.id,
    this.isSelected = false,
  });
}
