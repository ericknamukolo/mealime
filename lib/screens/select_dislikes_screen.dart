import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/dislikes.dart';
import 'package:mealime/screens/select_allergies_screen.dart';
import 'package:mealime/screens/servings_screen.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/dislike_card.dart';
import 'package:provider/provider.dart';

class SelectDislikesScreen extends StatelessWidget {
  static const routeName = '/select-dislikes-screen';
  const SelectDislikesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dislikesData = Provider.of<Dislikes>(context).dislikes;
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
        actions: const [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'See All',
                style: kBodyTextStylePrimary,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                'How about dislikes?',
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / .5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) => DislikeCard(
                  isSelected: dislikesData[index].isSelected,
                  dislike: dislikesData[index].dislike,
                ),
                itemCount: dislikesData.length,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CustomButton(
                  buttonLabel: 'Continue',
                  click: () {
                    Navigator.pushNamed(context, ServingsScreen.routeName);
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
