import 'package:flutter/cupertino.dart';
import 'package:mealime/models/goal.dart';

class Goals with ChangeNotifier {
  final List<Goal> _goals = [
    Goal(
        goal: 'Lose Weight',
        description: 'Lose some weight',
        id: '0',
        isSelected: false),
    Goal(
        goal: 'Maintain Weight',
        description: 'Maintain your weight',
        id: '1',
        isSelected: false),
    Goal(
        goal: 'Gain Weight',
        description: 'Put on some weight',
        id: '2',
        isSelected: false),
  ];
  List<Goal> get goals {
    return [..._goals];
  }

  void selectItem(String id) {
    _goals
        .where((goal) => goal.id != id)
        .map((goal) => goal.isSelected = false);
    var selectedItem = _goals.firstWhere((goal) => goal.id == id);
    selectedItem.isSelected = !selectedItem.isSelected;

    notifyListeners();
  }
}
