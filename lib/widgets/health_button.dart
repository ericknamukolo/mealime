import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/allergies.dart';
import 'package:mealime/widgets/allergy_card.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HealthButton extends StatelessWidget {
  final String text;

  const HealthButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allergiesData = Provider.of<Allergies>(context).allergies;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text, style: kBodyTextStyleBlack),
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
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / .5,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) => AllergyCard(
                      allergy: allergiesData[index].allergy,
                      isSelected: allergiesData[index].isSelected,
                    ),
                    itemCount: allergiesData.length,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                CustomButton(
                    buttonLabel: 'Save',
                    click: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.12),
              blurRadius: 6.0,
              offset: const Offset(0.0, 3.0),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                text,
                style: kBodyTextStyleBlack,
              ),
            ),
            const Icon(
              Icons.add_circle_rounded,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
