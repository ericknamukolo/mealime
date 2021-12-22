// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class DietCard extends StatefulWidget {
  final String diet;
  bool isSelected;
  DietCard({
    Key? key,
    required this.diet,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<DietCard> createState() => _DietCardState();
}

class _DietCardState extends State<DietCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          color: widget.isSelected ? kAccentColor : kGreyishColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.diet,
          style: kBodyTextStyleBlack,
        ),
      ),
    );
  }
}
