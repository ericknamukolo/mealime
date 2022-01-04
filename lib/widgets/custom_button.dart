import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonLabel;
  final Function() click;
  final double? buttonWidth;
  final bool? isLoading;
  const CustomButton({
    Key? key,
    required this.buttonLabel,
    required this.click,
    this.isLoading = false,
    this.buttonWidth = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        height: 50,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: isLoading! ? Colors.grey : kPrimaryColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.6),
              blurRadius: 6,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Center(
          child: Text(
            isLoading! ? 'Loading...' : buttonLabel,
            style: kBodyTextStyleWhite,
          ),
        ),
      ),
    );
  }
}
