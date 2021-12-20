import 'package:flutter/cupertino.dart';
import 'package:mealime/models/allergy.dart';
import 'package:mealime/models/dislike.dart';

class Dislikes with ChangeNotifier {
  final List<Dislike> _dislikes = [
    Dislike(
      dislike: 'Avocado',
      id: '0',
    ),
    Dislike(
      dislike: 'Beets',
      id: '1',
    ),
    Dislike(
      dislike: 'Eggplant',
      id: '2',
    ),
    Dislike(
      dislike: 'Mushrooms',
      id: '3',
    ),
    Dislike(
      dislike: 'Olives',
      id: '4',
    ),
    Dislike(
      dislike: 'Tofu',
      id: '5',
    ),
    Dislike(
      dislike: 'Turnips',
      id: '6',
    ),
    Dislike(
      dislike: 'Quinoa',
      id: '7',
    ),
  ];
  List<Dislike> get dislikes {
    return [..._dislikes];
  }
}
