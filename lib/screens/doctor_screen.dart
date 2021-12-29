// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/widgets/custom_button.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/doc.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.topRight,
          child: IconButton(
            icon:
                const Icon(Icons.close_rounded, size: 40, color: kPrimaryColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dr Grace Banda',
                  style: kTitleTextStyle.copyWith(fontSize: 20)),
              const Text('Nutrition Specialist', style: kBodyTextStyleGrey),
              const Text('UTH - Lusaka', style: kBodyTextStyleGrey),
              Container(
                // margin: const EdgeInsets.symmetric(vertical: 0),
                height: 80,
                child: Row(
                  children: const [
                    Expanded(
                        child: UIIcon(
                      icon: Icons.star_rounded,
                      data: '4.5 / 5.0',
                      title: 'Rating',
                      color: Color(0xffFFD700),
                    )),
                    SizedBox(width: 15),
                    Expanded(
                        child: UIIcon(
                      icon: Icons.supervised_user_circle_rounded,
                      data: '300+',
                      title: 'Patients',
                      color: kPrimaryColor,
                    )),
                  ],
                ),
              ),
              Text(
                'About',
                style: kTitleTextStyle.copyWith(fontSize: 18),
              ),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                style: kBodyTextStyleGrey,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                buttonLabel: 'Book Appointment',
                click: () {
                  showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now());
                },
                buttonWidth: double.infinity,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UIIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final String data;
  final Color color;
  const UIIcon({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.12),
                  blurRadius: 6.0,
                  offset: const Offset(0.0, 3.0),
                )
              ],
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: kBodyTextStyleGrey,
              ),
              Text(
                data,
                style: kNumberTextStyle.copyWith(
                    fontWeight: FontWeight.w100, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
