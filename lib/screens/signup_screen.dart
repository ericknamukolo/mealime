import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/personal_details_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime _dateOfBirth = DateTime(2000);
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
              const InputField(
                hint: 'Full Name',
                type: TextInputType.name,
              ),
              const InputField(
                hint: 'Email address',
                type: TextInputType.emailAddress,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date of birth',
                        style: kBodyTextStyleBlack.copyWith(fontSize: 12)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: double.infinity,
                      color: kGreyishColor,
                      // alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_dateOfBirth.day}/${_dateOfBirth.month}/${_dateOfBirth.year}',
                            style: kBodyTextStylePrimary.copyWith(fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () async {
                              DateTime? _newDate = await showDatePicker(
                                context: context,
                                initialDate: _dateOfBirth,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2010),
                              );
                              if (_newDate != null) {
                                setState(() {
                                  _dateOfBirth = _newDate;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              color: kPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const InputField(
                hint: 'Physical address',
                type: TextInputType.streetAddress,
              ),
              const InputField(
                hint: 'Password',
                type: TextInputType.visiblePassword,
              ),
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
