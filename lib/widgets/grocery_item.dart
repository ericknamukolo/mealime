// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';

class GroceryItem extends StatefulWidget {
  final String id;
  final String ingredient;
  final String quantity;
  bool isChecked;
  GroceryItem({
    Key? key,
    required this.id,
    required this.isChecked,
    required this.quantity,
    required this.ingredient,
  }) : super(key: key);

  @override
  State<GroceryItem> createState() => _GroceryItemState();
}

class _GroceryItemState extends State<GroceryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isChecked = !widget.isChecked;
        });
      },
      child: Container(
        child: Row(
          children: [
            Transform.scale(
              scale: 1.4,
              child: Checkbox(
                value: widget.isChecked,
                onChanged: (val) {},
                activeColor: const Color(0xff5A5A5A),
                shape: const CircleBorder(),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              widget.ingredient,
              style: widget.isChecked
                  ? kBodyTextStyleGrey.copyWith(
                      decoration: TextDecoration.lineThrough)
                  : kBodyTextStyleBlack.copyWith(fontWeight: FontWeight.normal),
            ),
            const Spacer(),
            Text(
              widget.quantity,
              style: kBodyTextStyleGrey,
            ),
          ],
        ),
      ),
    );
  }
}
