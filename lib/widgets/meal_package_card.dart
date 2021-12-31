import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';

class MealPackageCard extends StatelessWidget {
  final int planPrice;
  final String type;
  final bool isSelected;
  final Function() click;
  const MealPackageCard({
    Key? key,
    required this.planPrice,
    required this.type,
    required this.isSelected,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              isSelected ? Border.all(color: kPrimaryColor, width: 1) : null,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(0.12),
              blurRadius: 6.0,
              offset: const Offset(0.0, 3.0),
            )
          ],
        ),
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      MdiIcons.sealVariant,
                      size: 60,
                      color: isSelected
                          ? const Color(0xffFFD700)
                          : const Color(0xffB4B4B4),
                    ),
                    Text('$type Plan', style: kBodyTextStyleBlack),
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              color: kGreyishColor,
              thickness: 2,
              endIndent: 40,
              indent: 40,
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MealOnPlan(
                          icon: MdiIcons.coffee,
                          meal: 'Breakfast',
                          isSelected: isSelected,
                        ),
                        Text(
                          'K $planPrice',
                          style: kNumberTextStyle.copyWith(
                              fontSize: 20,
                              color: isSelected
                                  ? kPrimaryColor
                                  : const Color(0xffB4B4B4)),
                        ),
                      ],
                    ),
                    MealOnPlan(
                      icon: MdiIcons.foodTurkey,
                      meal: 'Lunch',
                      isSelected: isSelected,
                    ),
                    MealOnPlan(
                      icon: MdiIcons.foodSteak,
                      meal: 'Dinner',
                      isSelected: isSelected,
                    ),
                    MealOnPlan(
                      icon: MdiIcons.lightningBolt,
                      meal: '1000 - 1500 kCal',
                      isSelected: isSelected,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealOnPlan extends StatelessWidget {
  final String meal;
  final IconData icon;
  final bool isSelected;
  const MealOnPlan({
    Key? key,
    required this.meal,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: isSelected ? kPrimaryColor : const Color(0xffB4B4B4)),
        const SizedBox(width: 10),
        Text(meal, style: kBodyTextStyleGrey),
      ],
    );
  }
}
