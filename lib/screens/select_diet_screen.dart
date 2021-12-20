import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/diets.dart';
import 'package:mealime/screens/select_allergies_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/diet_card.dart';
import 'package:provider/provider.dart';

class SelectDietScreen extends StatelessWidget {
  static const routeName = '/select-diet-screen';
  const SelectDietScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dietsData = Provider.of<Diets>(context).diets;
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
                'Pick your diet',
                style: kTitleTextStyle,
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) => DietCard(
                  diet: dietsData[index].diet,
                  isSelected: dietsData[index].isSelected,
                ),
                itemCount: dietsData.length,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomButton(
                  buttonLabel: 'Continue',
                  click: () {
                    Navigator.pushNamed(
                        context, SelectAllergiesScreen.routeName);
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
