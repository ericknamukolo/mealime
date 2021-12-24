// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/goals.dart';
import 'package:provider/provider.dart';

class GoalCard extends StatefulWidget {
  final String description;
  final String goal;
  bool isSelected;
  GoalCard({
    required this.description,
    required this.goal,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<GoalCard> createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        height: 80,
        decoration: BoxDecoration(
          color: widget.isSelected ? kAccentColor : kGreyishColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.goal, style: kBodyTextStyleBlack),
            Text(
              widget.description,
              style: kBodyTextStyleBlack.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
