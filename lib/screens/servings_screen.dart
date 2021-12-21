import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/servings.dart';
import 'package:mealime/screens/sign_up_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/serving_card.dart';
import 'package:provider/provider.dart';

class ServingsScreen extends StatelessWidget {
  static const routeName = '/servings-screen';
  const ServingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final servingsData = Provider.of<Servings>(context).servings;
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
                'How many servings per meal?',
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ServingCard(
                  description: servingsData[index].description,
                  numberOfServings: servingsData[index].numOfServing,
                  isSelected: servingsData[index].isSelected,
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
