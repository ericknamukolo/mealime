import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/auth.dart';
import 'package:mealime/screens/mobile_verification.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/input_field.dart';
import 'package:provider/provider.dart';

class MobileRegistration extends StatefulWidget {
  static const routeName = '/mobile-registration-screen';
  const MobileRegistration({Key? key}) : super(key: key);

  @override
  State<MobileRegistration> createState() => _MobileRegistrationState();
}

class _MobileRegistrationState extends State<MobileRegistration> {
  final TextEditingController _mobileNumber = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _mobileNumber.dispose();
    super.dispose();
  }

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
            InputField(
              label: 'Phone Number',
              hint: 'e.g 0962885743',
              type: TextInputType.number,
              data: _mobileNumber,
            ),
            const SizedBox(height: 15),
            CustomButton(
              isLoading: _isLoading,
              buttonLabel: 'Continue',
              click: !_isLoading
                  ? () async {
                      try {
                        setState(() {
                          _isLoading = true;
                        });
                        await Provider.of<Auth>(context, listen: false)
                            .mobileRegistration(_mobileNumber.text);

                        Navigator.pushNamed(
                            context, MobileVerificationScreen.routeName);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(milliseconds: 2000),
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              'Please enter a valid number',
                              style: kBodyTextStyleGrey.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  : () {},
              buttonWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
