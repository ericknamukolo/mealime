import 'package:flutter/cupertino.dart';
import 'package:mealime/models/goal.dart';

class Goals with ChangeNotifier {
  final List<Goal> _goals = [
    Goal(goal: 'Lose Weight', description: 'Lose some weight', id: '0'),
    Goal(goal: 'Maintain Weight', description: 'Maintain your weight', id: '1'),
    Goal(
      goal: 'Gain Weight',
      description: 'Put on some weight',
      id: '2',
    ),
  ];
  List<Goal> get goals {
    return [..._goals];
  }
}
