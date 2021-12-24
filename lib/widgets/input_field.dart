import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';

class InputField extends StatelessWidget {
  final String hint;
  const InputField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        style: kBodyTextStyleGrey,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: hint,
          hintStyle: kBodyTextStyleGrey,
        ),
      ),
    );
  }
}
