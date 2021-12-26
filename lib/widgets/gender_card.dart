import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class GenderCard extends StatelessWidget {
  final String gender;
  final IconData icon;
  final bool iSelected;
  final Function() onTap;
  const GenderCard({
    Key? key,
    required this.iSelected,
    required this.gender,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: iSelected ? kAccentColor : kGreyishColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: iSelected
                  ? const Color(0xff000000).withOpacity(0.12)
                  : Colors.transparent,
              blurRadius: 6.0,
              offset: const Offset(0.0, 3.0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 45,
            ),
            Text(gender, style: kBodyTextStyleBlack),
          ],
        ),
      ),
    );
  }
}
