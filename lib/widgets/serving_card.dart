import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class ServingCard extends StatefulWidget {
  final int numberOfServings;
  final String description;
  bool isSelected;
  ServingCard({
    required this.description,
    required this.numberOfServings,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<ServingCard> createState() => _ServingCardState();
}

class _ServingCardState extends State<ServingCard> {
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
            Text('${widget.numberOfServings} servings',
                style: kBodyTextStyleBlack),
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
