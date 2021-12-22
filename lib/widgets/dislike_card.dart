import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

// ignore: must_be_immutable
class DislikeCard extends StatefulWidget {
  final String dislike;
  bool isSelected;
  DislikeCard({
    Key? key,
    required this.isSelected,
    required this.dislike,
  }) : super(key: key);

  @override
  State<DislikeCard> createState() => _DislikeCardState();
}

class _DislikeCardState extends State<DislikeCard> {
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
            widget.dislike,
            style: kBodyTextStyleBlack.copyWith(
              decoration: widget.isSelected ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}
