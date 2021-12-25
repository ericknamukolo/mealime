class Package {
  final String id;
  final String package;
  final String description;
  final double price;
  bool isSelected;

  Package({
    required this.id,
    required this.description,
    required this.package,
    required this.price,
    this.isSelected = false,
  });
}
