class Goal {
  final String id;
  final String goal;
  final String description;

  bool isSelected;

  Goal({
    required this.description,
    required this.goal,
    required this.id,
    this.isSelected = false,
  });
}
