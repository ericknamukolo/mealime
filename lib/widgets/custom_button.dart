import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonLabel;
  final Function() click;
  const CustomButton({
    Key? key,
    required this.buttonLabel,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: kPrimaryColor,
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
            buttonLabel,
            style: kBodyTextStyleWhite,
          ),
        ),
      ),
    );
  }
}
