import 'package:flutter/cupertino.dart';
import 'package:mealime/models/allergy.dart';

class Allergies with ChangeNotifier {
  final List<Allergy> _allergies = [
    Allergy(
      allergy: 'Gluten',
      id: '0',
    ),
    Allergy(
      allergy: 'Peanut',
      id: '1',
    ),
    Allergy(
      allergy: 'Tree Nut',
      id: '2',
    ),
    Allergy(
      allergy: 'Soy',
      id: '3',
    ),
    Allergy(
      allergy: 'Sesame',
      id: '4',
    ),
    Allergy(
      allergy: 'Mustard',
      id: '5',
    ),
    Allergy(
      allergy: 'Sulfite',
      id: '6',
    ),
    Allergy(
      allergy: 'Nightshade',
      id: '7',
    ),
  ];
  List<Allergy> get allergies {
    return [..._allergies];
  }
}
