// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/allergies.dart';
import 'package:mealime/screens/choose_package_screen.dart';
import 'package:mealime/widgets/allergy_card.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SelectAllergiesScreen extends StatelessWidget {
  static const routeName = '/select-allergies-screen';
  const SelectAllergiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allergiesData = Provider.of<Allergies>(context).allergies;
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
                'Any allergies?',
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / .5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) => AllergyCard(
                  allergy: allergiesData[index].allergy,
                  isSelected: allergiesData[index].isSelected,
                ),
                itemCount: allergiesData.length,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomButton(
                  buttonLabel: 'Continue',
                  click: () {
                    Navigator.of(context)
                        .pushNamed(ChoosePackageScreen.routeName);
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
