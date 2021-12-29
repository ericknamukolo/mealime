import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/home_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/input_field.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment-screen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
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
                'Payment',
                style: kTitleTextStyle,
              ),
            ),
            const Text(
              'Enter your mtn mobile number, you will receive a prompt message, confirm by entering your pin.',
              style: kBodyTextStyleGrey,
            ),
            const SizedBox(height: 10),
            const InputField(
              hint: 'MTN Mobile Number',
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonLabel: 'Continue',
              click: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              buttonWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
