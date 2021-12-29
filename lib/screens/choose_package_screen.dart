import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/payment_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/duration_card.dart';
import 'package:mealime/widgets/meal_card.dart';
import 'package:mealime/widgets/meal_package_card.dart';

class ChoosePackageScreen extends StatefulWidget {
  static const routeName = '/choose-package-screen';
  const ChoosePackageScreen({Key? key}) : super(key: key);

  @override
  State<ChoosePackageScreen> createState() => _ChoosePackageScreenState();
}

class _ChoosePackageScreenState extends State<ChoosePackageScreen> {
  bool _sevenD = true;
  bool _twentyOneD = false;
  bool _threeM = false;
  bool _sixM = false;
  /////////////
  bool _oneM = true;
  bool _twoM = false;
  bool _threeMs = false;
  ////////////
  bool _starter = true;
  bool _basic = false;
  bool _advanced = false;
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
                  'Choose meal plan',
                  style: kTitleTextStyle,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.timer_rounded, color: kPrimaryColor),
                  const SizedBox(width: 10),
                  Text(
                    'Duration',
                    style: kBodyTextStyleGrey.copyWith(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kGreyishColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DurationCard(
                      data: '7 days',
                      onTap: () {
                        setState(() {
                          if (_sevenD == false) {
                            _sevenD = true;
                            _twentyOneD = false;
                            _threeM = false;
                            _sixM = false;
                          }
                        });
                      },
                      isSelected: _sevenD,
                    ),
                    DurationCard(
                      data: '21 days',
                      onTap: () {
                        setState(() {
                          if (_twentyOneD == false) {
                            _twentyOneD = true;
                            _sevenD = false;
                            _threeM = false;
                            _sixM = false;
                          }
                        });
                      },
                      isSelected: _twentyOneD,
                    ),
                    DurationCard(
                      data: '3 months',
                      onTap: () {
                        setState(() {
                          if (_threeM == false) {
                            _threeM = true;
                            _sevenD = false;
                            _twentyOneD = false;
                            _sixM = false;
                          }
                        });
                      },
                      isSelected: _threeM,
                    ),
                    DurationCard(
                      data: '6 months',
                      onTap: () {
                        setState(() {
                          if (_sixM == false) {
                            _sixM = true;
                            _sevenD = false;
                            _twentyOneD = false;
                            _threeM = false;
                          }
                        });
                      },
                      isSelected: _sixM,
                    ),
                  ],
                ),
              ),
              /////////////////////////
              Row(
                children: [
                  const Icon(Icons.fastfood_rounded, color: kPrimaryColor),
                  const SizedBox(width: 10),
                  Text(
                    'Meals',
                    style: kBodyTextStyleGrey.copyWith(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kGreyishColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MealCard(
                      data: '1 meal',
                      onTap: () {
                        setState(() {
                          if (_oneM == false) {
                            _oneM = true;
                            _twoM = false;
                            _threeMs = false;
                          }
                        });
                      },
                      isSelected: _oneM,
                    ),
                    MealCard(
                      data: '2 meals',
                      onTap: () {
                        setState(() {
                          if (_twoM == false) {
                            _twoM = true;
                            _oneM = false;
                            _threeMs = false;
                          }
                        });
                      },
                      isSelected: _twoM,
                    ),
                    MealCard(
                      data: '3 meals',
                      onTap: () {
                        setState(() {
                          if (_threeMs == false) {
                            _threeMs = true;
                            _oneM = false;
                            _twoM = false;
                          }
                        });
                      },
                      isSelected: _threeMs,
                    ),
                  ],
                ),
              ),
              Text(
                'Available plans',
                style: kBodyTextStyleBlack.copyWith(
                    fontSize: 17, fontWeight: FontWeight.bold),
              ),
              MealPackageCard(
                planPrice: 450,
                type: 'Starter',
                isSelected: _starter,
                click: () {
                  setState(() {
                    if (_starter == false) {
                      _starter = true;
                      _basic = false;
                      _advanced = false;
                    }
                  });
                },
              ),
              MealPackageCard(
                planPrice: 600,
                type: 'Basic',
                isSelected: _basic,
                click: () {
                  setState(() {
                    if (_basic == false) {
                      _basic = true;
                      _starter = false;
                      _advanced = false;
                    }
                  });
                },
              ),
              MealPackageCard(
                planPrice: 900,
                type: 'Advanced',
                isSelected: _advanced,
                click: () {
                  setState(() {
                    if (_advanced == false) {
                      _advanced = true;
                      _starter = false;
                      _basic = false;
                    }
                  });
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomButton(
                    buttonLabel: 'Continue',
                    click: () {
                      Navigator.of(context).pushNamed(PaymentScreen.routeName);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
