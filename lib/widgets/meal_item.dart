// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgPath;
  final Function() click;

  bool isSelected;
  MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imgPath,
    required this.isSelected,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
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
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: click,
                      // onTap: () {
                      //   try {
                      //     Provider.of<Meals>(context, listen: false)
                      //         .selectMeal(id);
                      //   } catch (e) {
                      //     print(e);
                      //   }
                      // },
                      child: CircleAvatar(
                        backgroundColor:
                            isSelected ? kPrimaryColor : Colors.white,
                        radius: 12,
                        child: Icon(
                          isSelected ? Icons.check : Icons.add,
                          size: 20,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: kBodyTextStyleBlack),
                Text('1500 kCal',
                    style: kBodyTextStyleGrey.copyWith(
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
