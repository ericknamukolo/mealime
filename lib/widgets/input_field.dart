import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';

class InputField extends StatelessWidget {
  final String hint;
  final TextInputType type;
  final String? label;
  final TextEditingController? data;
  const InputField({
    Key? key,
    required this.hint,
    required this.type,
    this.data,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label ?? hint,
              style: kBodyTextStyleBlack.copyWith(fontSize: 12)),
          TextField(
            controller: data,
            style: kBodyTextStyleBlack,
            keyboardType: type,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              border: InputBorder.none,
              filled: true,
              hintText: hint,
              hintStyle: kBodyTextStyleGrey,
            ),
          ),
        ],
      ),
    );
  }
}
