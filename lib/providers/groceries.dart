import 'package:flutter/cupertino.dart';
import 'package:mealime/models/grocery.dart';

class Groceries with ChangeNotifier {
  final List<Grocery> _groceries = [
    Grocery(id: '0', ingredient: 'lemon', quantity: '1.5'),
    Grocery(id: '1', ingredient: 'lime', quantity: '4'),
    Grocery(id: '2', ingredient: 'mango', quantity: '1.5'),
    Grocery(id: '3', ingredient: 'orange', quantity: '1.5'),
    Grocery(id: '4', ingredient: 'cucumber', quantity: '1.5'),
    Grocery(id: '5', ingredient: 'garlic', quantity: '6 cloves'),
    Grocery(id: '6', ingredient: 'ginger root', quantity: '2 pieces'),
    Grocery(id: '7', ingredient: 'tomatoes', quantity: '1 pint'),
  ];
  List<Grocery> get groceries {
    return [..._groceries];
  }
}
