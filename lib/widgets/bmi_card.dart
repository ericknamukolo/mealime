import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class BMICard extends StatelessWidget {
  final double _bmi;
  final String status;

  const BMICard({
    Key? key,
    required double bmi,
    required this.status,
  })  : _bmi = bmi,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color updateColor() {
      if (_bmi < 18.5) {
        return Colors.orange[300]!;
      } else if (_bmi >= 18.5 && _bmi <= 24.9) {
        return kPrimaryColor;
      } else if (_bmi >= 25.0 && _bmi <= 29.9) {
        return Colors.red[300]!;
      } else if (_bmi >= 30.0) {
        return Colors.red;
      }
      return kPrimaryColor;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BMI', style: kBodyTextStyleBlack.copyWith(fontSize: 12)),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          decoration: BoxDecoration(
            color: kGreyishColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.12),
                blurRadius: 6.0,
                offset: const Offset(0.0, 3.0),
              )
            ],
          ),
          height: 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                status,
                style: kBodyTextStylePrimary.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: updateColor(),
                ),
              ),
              Text(
                _bmi.toStringAsFixed(1),
                style: kNumberTextStyle,
              ),
              Column(
                children: [
                  Text(
                    'Normal BMI range',
                    style: kBodyTextStyleBlack.copyWith(fontSize: 14),
                  ),
                  Text(
                    '18.5 - 24.9 kg/m2',
                    style: kBodyTextStyleBlack.copyWith(
                        fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
