import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/goals_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/input_field.dart';

class PersonalDetailsScreen extends StatelessWidget {
  static const routeName = '/personal-details-screen';
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Personal Details',
                  style: kTitleTextStyle,
                ),
              ),
              const Text(
                'Enter your personal information.',
                style: kBodyTextStyleGrey,
              ),
              const SizedBox(height: 10),
              const InputField(
                hint: 'Full Name',
              ),
              const InputField(
                hint: 'Email Address',
              ),
              const InputField(
                hint: 'Province',
              ),
              const InputField(
                hint: 'Physical address',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomButton(
                    buttonLabel: 'Save',
                    click: () {
                      Navigator.of(context).pushNamed(GoalsScreen.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
