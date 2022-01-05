import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/home_screen.dart';
import 'package:mealime/widgets/custom_button.dart';

class PaymentScreen extends StatefulWidget {
  static const routeName = '/payment-screen';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
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
                  'Payment',
                  style: kTitleTextStyle,
                ),
              ),
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                onCreditCardWidgetChange:
                    (creditCardBrand) {}, //true when you want to show cvv(back) view
              ),
              CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                themeColor: Colors.blue,
                textColor: Colors.white,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: kBodyTextStyleGrey,
                  labelStyle: kBodyTextStyleGrey,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                expiryDateDecoration: InputDecoration(
                  hintStyle: kBodyTextStyleGrey,
                  labelStyle: kBodyTextStyleGrey,
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  hintStyle: kBodyTextStyleGrey,
                  labelStyle: kBodyTextStyleGrey,
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(
                  hintStyle: kBodyTextStyleGrey,
                  labelStyle: kBodyTextStyleGrey,
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Card Holder',
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              // const Text(
              //   'Enter your mtn mobile number, you will receive a prompt message, confirm by entering your pin.',
              //   style: kBodyTextStyleGrey,
              // ),
              // const SizedBox(height: 10),
              // const InputField(
              //   hint: 'MTN Mobile Number',
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomButton(
                  buttonLabel: 'Proceed',
                  buttonWidth: double.infinity,
                  click: () {
                    // if (formKey.currentState!.validate()) {
                    //   print('valid!');
                    // } else {
                    //   print('invalid!');
                    // }
                    Navigator.of(context).pushNamed(HomeScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
