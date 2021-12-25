import 'package:flutter/cupertino.dart';
import 'package:mealime/models/package_pack.dart';

class Packages with ChangeNotifier {
  final List<Package> _packages = [
    Package(
      id: '0',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      package: 'Basic Package',
      price: 249.9,
    ),
    Package(
      id: '1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      package: 'Standard Package',
      price: 449.9,
    ),
    Package(
      id: '2',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
      package: 'Special Package',
      price: 649.9,
    ),
  ];

  List<Package> get packages {
    return [..._packages];
  }
}
