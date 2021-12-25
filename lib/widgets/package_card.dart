import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class PackageCard extends StatefulWidget {
  final String id;
  final String title;
  final String desc;
  final double price;
  bool isSelected;
  PackageCard({
    Key? key,
    required this.id,
    required this.title,
    required this.desc,
    required this.price,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.isSelected ? kAccentColor : kGreyishColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: kBodyTextStyleBlack),
                Text('K ${widget.price}',
                    style: kBodyTextStyleBlack.copyWith(
                        color: kPrimaryColor, fontSize: 22)),
              ],
            ),
            Text(
              widget.desc,
              style: kBodyTextStyleBlack.copyWith(
                  fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
