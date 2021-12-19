import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';

class IntroScreenContent extends StatelessWidget {
  final String title;
  final String description;
  const IntroScreenContent({
    Key? key,
    required this.description,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: kTitleTextStyle,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 200,
          color: Colors.grey,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: kBodyTextStyleGrey,
          ),
        ),
      ],
    );
  }
}
