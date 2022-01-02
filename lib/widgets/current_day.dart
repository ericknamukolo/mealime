import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class CurrentDayCard extends StatelessWidget {
  final bool isSelected;
  final int day;
  const CurrentDayCard({
    Key? key,
    required this.isSelected,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      width: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : kGreyishColor,
        borderRadius: BorderRadius.circular(5.0),
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
      child: Text(
        '$day',
        style: kNumberTextStyle.copyWith(
            fontSize: 15,
            color: isSelected ? kPrimaryColor : const Color(0xffB4B4B4)),
      ),
      alignment: Alignment.center,
    );
  }
}
