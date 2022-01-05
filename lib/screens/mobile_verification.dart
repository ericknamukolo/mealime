import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/auth.dart';
import 'package:mealime/screens/signup_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class MobileVerificationScreen extends StatelessWidget {
  static const routeName = '/mobile-verification-screen';
  const MobileVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otp = Provider.of<Auth>(context, listen: false).otp;
    int? _otpCode;
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
                        'Enter the verification code you received on the number\n',
                    style: kBodyTextStyleGrey,
                  ),
                  TextSpan(
                    text: otp!.phoneNumber,
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
                _otpCode = int.parse(val);
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
              click: () async {
                if (_otpCode == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 2000),
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        'Enter the otp code',
                        style: kBodyTextStyleGrey.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                  return;
                }
                try {
                  await Provider.of<Auth>(context, listen: false)
                      .mobileVerification(_otpCode!);
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 2000),
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        '$_otpCode is an incorrect pin',
                        style: kBodyTextStyleGrey.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
              buttonWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
