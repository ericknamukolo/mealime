import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/meal_plan_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgPath;
  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(MealPlanDetailsScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: 220,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: const [
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Text(title, style: kBodyTextStyleBlack),
            ),
          ],
        ),
      ),
    );
  }
}
