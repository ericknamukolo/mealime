import 'package:flutter/material.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/intro_screen.dart';
import 'package:mealime/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Text(
            'MeaLime',
            style: kTitleTextStyle.copyWith(fontSize: 40),
          ),
          Column(
            children: [
              CustomButton(
                buttonLabel: 'Get Started',
                click: () {
                  Navigator.pushNamed(context, IntroScreen.routeName);
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Already a member? Sign in',
                  style: kBodyTextStyleGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
