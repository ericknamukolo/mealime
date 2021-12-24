import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/mobile_registration.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/intro_screen_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  static const routeName = '/intro-screen';
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageScrollController = PageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leadingWidth: 400,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(width: 15),
              Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
              ),
              Text(
                'Back',
                style: kBodyTextStylePrimary,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView(
              controller: _pageScrollController,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              physics: const BouncingScrollPhysics(),
              children: const [
                IntroScreenContent(
                  title: 'Personalized meal planning',
                  description:
                      'Pick your week\'s meals in miutes. With over 200 personalization options, eat exactly how you want to eat.',
                ),
                IntroScreenContent(
                  description:
                      'Grocery shop once per week with an organized "done for you" shopping list',
                  title: 'Simple, stress-free grocery shopping',
                ),
                IntroScreenContent(
                  description:
                      'Easily cook healthy, delicious meals in about 30 minutes, from start to finish',
                  title: 'Delicious, healthy meals made easy',
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmoothPageIndicator(
                  controller: _pageScrollController,
                  count: 3,
                  effect: const ScrollingDotsEffect(
                    fixedCenter: true,
                    activeDotColor: Color(0xff656565),
                    radius: 5,
                  ),
                ),
                CustomButton(
                  buttonLabel: 'Continue',
                  click: () {
                    Navigator.pushNamed(context, MobileRegistration.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
