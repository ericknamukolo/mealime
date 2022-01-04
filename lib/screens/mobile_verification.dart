import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/personal_details_screen.dart';
import 'package:mealime/screens/signup_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MobileVerificationScreen extends StatelessWidget {
  static const routeName = '/mobile-verification-screen';
  const MobileVerificationScreen({Key? key}) : super(key: key);

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
                'Mobile verificaton',
                style: kTitleTextStyle,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:
                        'Enter the verification code you received on the number',
                    style: kBodyTextStyleGrey,
                  ),
                  TextSpan(
                    text: ' +260962885743.',
                    style: kBodyTextStyleGrey.copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              textStyle: kBodyTextStyleBlack.copyWith(fontSize: 23),
              appContext: context,
              length: 6,
              onChanged: (val) {
                print(val);
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Didn\'t receive any code?',
                      style: kBodyTextStyleGrey,
                    ),
                    TextSpan(
                      text: ' Resend Code',
                      style: kBodyTextStyleGrey.copyWith(color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonLabel: 'Verify',
              click: () {
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
              buttonWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
