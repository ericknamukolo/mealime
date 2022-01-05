import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/auth.dart';
import 'package:mealime/screens/home_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/input_field.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in-screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _mobileNumber = TextEditingController();
    final TextEditingController _password = TextEditingController();
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
                  'Sign In',
                  style: kTitleTextStyle,
                ),
              ),
              const Text(
                'Enter your mobile number & password to continue.',
                style: kBodyTextStyleGrey,
              ),
              const SizedBox(height: 10),
              InputField(
                label: 'Phone Number',
                hint: 'e.g 0962885743',
                type: TextInputType.number,
                data: _mobileNumber,
              ),
              InputField(
                hint: 'Password',
                type: TextInputType.visiblePassword,
                data: _password,
              ),
              const SizedBox(height: 15),
              CustomButton(
                isLoading: _isLoading,
                buttonLabel: 'Sign in',
                click: !_isLoading
                    ? () async {
                        try {
                          setState(() {
                            _isLoading = true;
                          });
                          await Provider.of<Auth>(context, listen: false)
                              .signIn(_mobileNumber.text, _password.text);

                          Navigator.pushNamed(context, HomeScreen.routeName);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(milliseconds: 2000),
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                'Phone number or password is incorrect',
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
      ),
    );
  }
}
