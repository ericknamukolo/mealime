// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class AllergyCard extends StatefulWidget {
  final String allergy;
  bool isSelected;
  AllergyCard({
    Key? key,
    required this.allergy,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<AllergyCard> createState() => _AllergyCardState();
}

class _AllergyCardState extends State<AllergyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.isSelected ? kAccentColor : kGreyishColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.allergy,
            style: kBodyTextStyleBlack.copyWith(
              decoration: widget.isSelected ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}
