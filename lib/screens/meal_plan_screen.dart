import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/meals.dart';
import 'package:mealime/widgets/meal_item.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Most Porpular', style: kBodyTextStyleBlack),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Recently Created', style: kBodyTextStyleBlack),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Top Rated', style: kBodyTextStyleBlack),
                  Text('See all', style: kBodyTextStylePrimary),
                ],
              ),
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
