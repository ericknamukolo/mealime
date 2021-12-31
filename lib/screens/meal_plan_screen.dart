import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/meals.dart';
import 'package:mealime/widgets/current_day.dart';
import 'package:mealime/widgets/meal_card.dart';
import 'package:mealime/widgets/meal_item.dart';
import 'package:mealime/widgets/type_of_meal.dart';
import 'package:provider/provider.dart';

class MealPlanScreen extends StatelessWidget {
  static const routeName = '/meal-plan';
  const MealPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealsData = Provider.of<Meals>(context).meals;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        title: const Center(
          child: Text(
            'Build a meal plan',
            style: kBodyTextStyleBlack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Build a meal plan',
                style: kTitleTextStyle,
              ),
              Row(
                children: [
                  const Icon(MdiIcons.calendar, color: kPrimaryColor),
                  const SizedBox(width: 10),
                  Text(
                    'January',
                    style: kBodyTextStyleGrey.copyWith(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kGreyishColor,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CurrentDayCard(isSelected: true, day: 1),
                    CurrentDayCard(isSelected: false, day: 2),
                    CurrentDayCard(isSelected: false, day: 3),
                    CurrentDayCard(isSelected: false, day: 4),
                    CurrentDayCard(isSelected: false, day: 5),
                    CurrentDayCard(isSelected: false, day: 6),
                    CurrentDayCard(isSelected: false, day: 7),
                    CurrentDayCard(isSelected: false, day: 8),
                    CurrentDayCard(isSelected: false, day: 9),
                    CurrentDayCard(isSelected: false, day: 10),
                    CurrentDayCard(isSelected: false, day: 11),
                    CurrentDayCard(isSelected: false, day: 12),
                    CurrentDayCard(isSelected: false, day: 13),
                    CurrentDayCard(isSelected: false, day: 14),
                    CurrentDayCard(isSelected: false, day: 15),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(MdiIcons.foodDrumstick, color: kPrimaryColor),
                  const SizedBox(width: 10),
                  Text(
                    'Meal',
                    style: kBodyTextStyleGrey.copyWith(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kGreyishColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TypeOfMealCard(
                      data: 'Breakfast',
                      isSelected: true,
                      onTap: () {},
                    ),
                    TypeOfMealCard(
                      data: 'Lunch',
                      isSelected: false,
                      onTap: () {},
                    ),
                    TypeOfMealCard(
                      data: 'Supper',
                      isSelected: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Breakfast', style: kBodyTextStyleBlack),
                  Text('See all', style: kBodyTextStylePrimary),
                ],
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemBuilder: (context, index) => MealItem(
                    id: mealsData[index].id,
                    imgPath: mealsData[index].imgPath,
                    title: mealsData[index].title,
                  ),
                  itemCount: mealsData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemBuilder: (context, index) => MealItem(
                    id: mealsData[index].id,
                    imgPath: mealsData[index].imgPath,
                    title: mealsData[index].title,
                  ),
                  itemCount: mealsData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Text('Top Rated', style: kBodyTextStyleBlack),
              //     Text('See all', style: kBodyTextStylePrimary),
              //   ],
              // ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemBuilder: (context, index) => MealItem(
                    id: mealsData[index].id,
                    imgPath: mealsData[index].imgPath,
                    title: mealsData[index].title,
                  ),
                  itemCount: mealsData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
