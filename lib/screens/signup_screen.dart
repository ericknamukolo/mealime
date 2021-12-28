import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/personal_details_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/input_field.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/sign-up-screen';
  const SignUpScreen({Key? key}) : super(key: key);

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
                  'Sign Up',
                  style: kTitleTextStyle,
                ),
              ),
              const Text(
                'Make an account with us.',
                style: kBodyTextStyleGrey,
              ),
              const InputField(hint: 'Full Name'),
              const InputField(hint: 'Email address'),
              const InputField(hint: 'Physical address'),
              const InputField(hint: 'Password'),
              const InputField(hint: 'Confirm password'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: CustomButton(
                  buttonLabel: 'Sign Up',
                  click: () {
                    Navigator.of(context)
                        .pushNamed(PersonalDetailsScreen.routeName);
                  },
                  buttonWidth: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
