import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';

class MealCard extends StatelessWidget {
  final String data;
  final bool isSelected;
  final Function() onTap;
  const MealCard({
    Key? key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
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
        child: Center(
          child: Text(
            data,
            style: isSelected
                ? kBodyTextStylePrimary
                : kBodyTextStyleGrey.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
          ),
        ),
      ),
    );
  }
}
