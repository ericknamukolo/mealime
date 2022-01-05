import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/home_screen.dart';
import 'package:mealime/screens/intro_screen.dart';
import 'package:mealime/screens/sign_in_screen.dart';
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            child: Text(
              'Omnis Food',
              style:
                  kTitleTextStyle.copyWith(fontSize: 30, color: kAccentColor),
            ),
          ),
          Column(
            children: [
              CustomButton(
                buttonLabel: 'Get Started',
                click: () {
                  Navigator.pushNamed(context, IntroScreen.routeName);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignInScreen.routeName);
                  },
                  child: const Text(
                    'Already a member? Sign in',
                    style: kBodyTextStyleGrey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
