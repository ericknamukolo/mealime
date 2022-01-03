import 'package:flutter/cupertino.dart';
import 'package:mealime/models/meal.dart';

class Meals with ChangeNotifier {
  final List<Meal> _meals = [
    Meal(
      id: '0',
      breakFast: true,
      title: 'Fried Chicken',
      imgPath: 'assets/meal1.jpg',
    ),
    Meal(
      id: '1',
      breakFast: true,
      title: 'Fried Beef',
      imgPath: 'assets/meal2.jpg',
    ),
    Meal(
      id: '2',
      breakFast: true,
      title: 'Random meal',
      imgPath: 'assets/meal3.jpg',
    ),
    Meal(
      id: '3',
      breakFast: true,
      title: 'Another meal',
      imgPath: 'assets/meal4.jpg',
    ),
    ////////////lunch
    Meal(
      id: '4',
      lunch: true,
      title: 'Fried Chicken',
      imgPath: 'assets/meal1.jpg',
    ),
    Meal(
      id: '5',
      lunch: true,
      title: 'Fried Beef',
      imgPath: 'assets/meal2.jpg',
    ),
    Meal(
      id: '6',
      lunch: true,
      title: 'Random meal',
      imgPath: 'assets/meal3.jpg',
    ),
    Meal(
      id: '7',
      lunch: true,
      title: 'Another meal',
      imgPath: 'assets/meal4.jpg',
    ),

    ///supper
    Meal(
      id: '8',
      supper: true,
      title: 'Fried Chicken',
      imgPath: 'assets/meal1.jpg',
    ),
    Meal(
      id: '9',
      supper: true,
      title: 'Fried Beef',
      imgPath: 'assets/meal2.jpg',
    ),
    Meal(
      id: '10',
      supper: true,
      title: 'Random meal',
      imgPath: 'assets/meal3.jpg',
    ),
    Meal(
      id: '13',
      supper: true,
      title: 'Another meal',
      imgPath: 'assets/meal4.jpg',
    ),
  ];

  List<Meal> get meals {
    return [..._meals];
  }

  int pageNumber = 0;
  Future<void> selectMeal(String id, List<Meal> meal) async {
    var pickedMeal = _meals.firstWhere((meal) => meal.id == id);

    if (meal.isEmpty) {
      pickedMeal.isSelected = true;
      meal.add(pickedMeal);
    } else {
      throw Exception('A meal (${meal[0].title}) has already been picked');
    }
    notifyListeners();
  }

  void removeMeals() {
    for (var meal in _meals) {
      meal.isSelected = false;
    }
    breakfastMeal.clear();
    lunchMeal.clear();
    supperMeal.clear();
    notifyListeners();
  }

  List<Meal> breakfastMeal = [];
  List<Meal> lunchMeal = [];
  List<Meal> supperMeal = [];
}
