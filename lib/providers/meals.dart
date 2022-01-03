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
  void selectMeal(String id) {
    var pickedMeal = _meals.firstWhere((meal) => meal.id == id);

    if (selectedMeals.where((meal) => meal.breakFast == true).toList().length <=
            1 ||
        selectedMeals.where((meal) => meal.lunch == true).toList().length <=
            1 ||
        selectedMeals.where((meal) => meal.supper == true).toList().length <=
            1) {
      pickedMeal.isSelected = true;
      pageNumber++;
      selectedMeals.add(pickedMeal);
    }

    notifyListeners();
  }

  List<Meal> selectedMeals = [];
}
