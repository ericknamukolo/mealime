import 'package:flutter/cupertino.dart';
import 'package:mealime/models/diet.dart';
import 'package:mealime/models/serving.dart';

class Servings with ChangeNotifier {
  final List<Serving> _servings = [
    Serving(
        description: 'for two or one with left overs',
        numOfServing: 2,
        id: '0'),
    Serving(
        description: 'for four, or two-three with left overs',
        numOfServing: 4,
        id: '0'),
    Serving(description: 'for a family of 5+', numOfServing: 6, id: '0'),
  ];
  List<Serving> get servings {
    return [..._servings];
  }
}
