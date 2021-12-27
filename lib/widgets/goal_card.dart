import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class GoalCard extends StatelessWidget {
  final String goal;
  final String range;
  final bool isSelected;
  final IconData icon;
  final Function() click;
  const GoalCard({
    Key? key,
    required this.goal,
    required this.click,
    required this.range,
    required this.isSelected,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          color: isSelected ? kAccentColor : kGreyishColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xff000000).withOpacity(0.12)
                  : Colors.transparent,
              blurRadius: 6.0,
              offset: const Offset(0.0, 3.0),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  goal,
                  style: kBodyTextStyleBlack.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 5),
                Text(
                  '$range kCal',
                  style: kNumberTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
