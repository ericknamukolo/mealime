import 'package:flutter/material.dart';
import 'package:mealime/models/meal.dart';
import 'package:mealime/widgets/meal_item.dart';

class BreakFastMealsSection extends StatelessWidget {
  const BreakFastMealsSection({
    Key? key,
    required this.mealsData,
  }) : super(key: key);

  final List<Meal> mealsData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) => MealItem(
        id: mealsData[index].id,
        imgPath: mealsData[index].imgPath,
        title: mealsData[index].title,
        isSelected: mealsData[index].isSelected,
      ),
      itemCount: mealsData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
