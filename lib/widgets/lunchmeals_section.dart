import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/models/meal.dart';
import 'package:mealime/providers/meals.dart';
import 'package:mealime/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class LunchMealsSection extends StatelessWidget {
  const LunchMealsSection({
    Key? key,
    required this.mealsData,
  }) : super(key: key);

  final List<Meal> mealsData;

  @override
  Widget build(BuildContext context) {
    final selectedLunchMeal =
        Provider.of<Meals>(context, listen: false).lunchMeal;
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
          click: () {
            Provider.of<Meals>(context, listen: false)
                .selectMeal(mealsData[index].id, selectedLunchMeal)
                .catchError((e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(milliseconds: 2000),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    e.message,
                    style: kBodyTextStyleGrey.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            });
          }),
      itemCount: mealsData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
