import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/goals.dart';
import 'package:mealime/screens/sign_up_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/goal_card.dart';
import 'package:provider/provider.dart';

class GoalsScreen extends StatelessWidget {
  static const routeName = '/servings-screen';
  const GoalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final servingsData = Provider.of<Goals>(context).goals;
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'What is your goal?',
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GoalCard(
                  description: servingsData[index].description,
                  isSelected: servingsData[index].isSelected,
                  goal: servingsData[index].goal,
                ),
                itemCount: servingsData.length,
                shrinkWrap: true,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomButton(
                  buttonLabel: 'Continue',
                  click: () {
                    Navigator.pushNamed(context, SignUpScreen.routeName);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
