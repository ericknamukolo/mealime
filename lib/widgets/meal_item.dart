import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 200,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/meal2.jpg'),
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
          const Expanded(
            child: Text('Fried beef', style: kBodyTextStyleBlack),
          ),
        ],
      ),
    );
  }
}
