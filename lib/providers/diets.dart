import 'package:flutter/cupertino.dart';
import 'package:mealime/models/diet.dart';

class Diets with ChangeNotifier {
  final List<Diet> _diets = [
    Diet(
      diet: 'Classic',
      id: '0',
    ),
    Diet(
      diet: 'Low Carb',
      id: '1',
    ),
    Diet(
      diet: 'Keto',
      id: '2',
    ),
    Diet(
      diet: 'Flexitarian',
      id: '3',
    ),
    Diet(
      diet: 'Paleo',
      id: '4',
    ),
    Diet(
      diet: 'Vegetarian',
      id: '5',
    ),
    Diet(
      diet: 'Pescetarian',
      id: '6',
    ),
    Diet(
      diet: 'Vegan',
      id: '7',
    ),
  ];
  List<Diet> get diets {
    return [..._diets];
  }
}
