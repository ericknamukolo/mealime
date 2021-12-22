import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/widgets/meal_item.dart';

class MealPlanScreen extends StatelessWidget {
  static const routeName = '/meal-plan';
  const MealPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Container(
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
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) => MealItem(),
                itemCount: 4,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
