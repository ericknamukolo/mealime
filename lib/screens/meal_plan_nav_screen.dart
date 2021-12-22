import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/meal_plan_screen.dart';
import 'package:mealime/widgets/custom_button.dart';

class MealPlanNavScreen extends StatelessWidget {
  const MealPlanNavScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your personalized meal plan',
            style: kTitleTextStyle,
          ),
          const SizedBox(height: 10),
          const Text(
            'Plan your meals for the entire week in minutes. Build your first meal plan to get started!',
            style: kBodyTextStyleGrey,
          ),
          const SizedBox(height: 20),
          CustomButton(
            buttonLabel: 'Build Your First Meal Plan',
            click: () {
              Navigator.of(context).pushNamed(MealPlanScreen.routeName);
            },
            buttonWidth: double.infinity,
          ),
        ],
      ),
    );
  }
}
