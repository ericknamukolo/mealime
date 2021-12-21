import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/home_screen.dart';
import 'package:mealime/widgets/custom_button.dart';

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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an account',
              style: kTitleTextStyle,
            ),
            const Text(
              'Share your account with your family and accross your devices.',
              style: kBodyTextStyleGrey,
            ),
            const SizedBox(height: 10),
            const TextField(
              style: kBodyTextStyleGrey,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                hintText: 'Email address',
                hintStyle: kBodyTextStyleGrey,
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonLabel: 'Done',
              click: () {
                Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              buttonWidth: double.infinity,
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                'By using mealime you agree to our terms',
                textAlign: TextAlign.center,
                style: kBodyTextStyleGrey.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
