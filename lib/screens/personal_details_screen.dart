// ignore_for_file: avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/goals_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/gender_card.dart';
import 'package:mealime/widgets/input_field.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PersonalDetailsScreen extends StatefulWidget {
  static const routeName = '/personal-details-screen';
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  bool male = false;
  bool female = false;
  double _weight = 50;
  double _height = 180;
  double _actualWeight = 50;
  double _actualHeight = 180;

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
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'Personal Details',
                  style: kTitleTextStyle,
                ),
              ),
              const Text(
                'Enter your personal information.',
                style: kBodyTextStyleGrey,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenderCard(
                    gender: 'Male',
                    icon: Icons.male_rounded,
                    iSelected: male,
                    onTap: () {
                      setState(() {
                        if (male == false) {
                          male = true;
                          female = false;
                        } else {
                          male = false;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: kGreyishColor,
                      thickness: 3,
                    ),
                  ),
                  GenderCard(
                    gender: 'Female',
                    icon: Icons.female_rounded,
                    iSelected: female,
                    onTap: () {
                      setState(() {
                        if (female == false) {
                          male = false;
                          female = true;
                        } else {
                          female = false;
                        }
                      });
                    },
                  ),
                ],
              ),
              const InputField(
                hint: 'Full Name',
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weight & Height',
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
                            '${_actualWeight.toStringAsFixed(1)} kg -- ${_actualHeight.toStringAsFixed(1)} cm',
                            style: kBodyTextStylePrimary.copyWith(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => StatefulBuilder(
                                  builder: (BuildContext context,
                                          void Function(void Function())
                                              setState) =>
                                      Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Weight & Height',
                                                style: kBodyTextStyleBlack),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: const Icon(
                                                Icons.close_rounded,
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        //WEIGHT
                                        Text('${_weight.toStringAsFixed(1)} KG',
                                            style: kNumberTextStyle),
                                        SfSlider(
                                          activeColor: kPrimaryColor,
                                          min: 20.0,
                                          max: 120.0,
                                          interval: 20,
                                          showTicks: true,
                                          showLabels: true,
                                          enableTooltip: false,
                                          minorTicksPerInterval: 1,
                                          value: _weight,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _weight = newValue;
                                            });
                                          },
                                          onChangeEnd: (val) {
                                            setState(() {
                                              _actualWeight = val;
                                            });
                                          },
                                        ),
                                        const SizedBox(height: 40),
                                        //HEIGHT
                                        Text('${_height.toStringAsFixed(1)} CM',
                                            style: kNumberTextStyle),
                                        SfSlider(
                                          activeColor: kPrimaryColor,
                                          min: 120.0,
                                          max: 220.0,
                                          interval: 20,
                                          showTicks: true,
                                          showLabels: true,
                                          enableTooltip: false,
                                          minorTicksPerInterval: 1,
                                          value: _height,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _height = newValue;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).whenComplete(() {
                                setState(() {
                                  _actualHeight = _height;
                                  _actualWeight = _weight;
                                });
                              });
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
                hint: 'Email Address',
              ),
              const InputField(
                hint: 'Province',
              ),
              const InputField(
                hint: 'Physical address',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomButton(
                    buttonLabel: 'Save',
                    click: () {
                      Navigator.of(context).pushNamed(GoalsScreen.routeName);
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
