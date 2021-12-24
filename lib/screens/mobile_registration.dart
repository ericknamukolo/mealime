import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/mobile_verification.dart';
import 'package:mealime/widgets/custom_button.dart';

class MobileRegistration extends StatelessWidget {
  static const routeName = '/mobile-registration-screen';
  const MobileRegistration({Key? key}) : super(key: key);

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
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'Mobile registration',
                style: kTitleTextStyle,
              ),
            ),
            const Text(
              'Enter your mobile number, you will receive a verification code to verify your number.',
              style: kBodyTextStyleGrey,
            ),
            const SizedBox(height: 10),
            const TextField(
              style: kBodyTextStyleGrey,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                hintText: 'Mobile Number',
                hintStyle: kBodyTextStyleGrey,
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonLabel: 'Continue',
              click: () {
                Navigator.pushNamed(
                    context, MobileVerificationScreen.routeName);
              },
              buttonWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
