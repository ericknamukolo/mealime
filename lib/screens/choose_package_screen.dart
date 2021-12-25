import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/package_packs.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/package_card.dart';
import 'package:provider/provider.dart';

class ChoosePackageScreen extends StatelessWidget {
  static const routeName = '/choose-package-screen';
  const ChoosePackageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final packagesData = Provider.of<Packages>(context).packages;
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
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'Choose the best package for you.',
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => PackageCard(
                  id: packagesData[index].id,
                  desc: packagesData[index].description,
                  price: packagesData[index].price,
                  title: packagesData[index].package,
                  isSelected: packagesData[index].isSelected,
                ),
                itemCount: packagesData.length,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomButton(
                  buttonLabel: 'Continue',
                  click: () {
                    // Navigator.of(context)
                    //     .pushNamed(ChoosePackageScreen.routeName);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
