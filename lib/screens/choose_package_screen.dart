import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class ChoosePackageScreen extends StatelessWidget {
  static const routeName = '/choose-package-screen';
  const ChoosePackageScreen({Key? key}) : super(key: key);

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
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'Choose Package',
                style: kTitleTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
