// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/providers/meals.dart';
import 'package:mealime/widgets/breakfastmeals_section.dart';
import 'package:mealime/widgets/current_day.dart';
import 'package:mealime/widgets/custom_button.dart';
import 'package:mealime/widgets/lunchmeals_section.dart';

import 'package:mealime/widgets/suppermeals_section.dart';
import 'package:mealime/widgets/type_of_meal.dart';
import 'package:provider/provider.dart';

class MealPlanScreen extends StatefulWidget {
  static const routeName = '/meal-plan';
  const MealPlanScreen({Key? key}) : super(key: key);

  @override
  State<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController _pageController =
        PageController(initialPage: _pageIndex);
    final breakfastMealsData = Provider.of<Meals>(context)
        .meals
        .where((meal) => meal.breakFast == true)
        .toList();
    final lunchMealsData = Provider.of<Meals>(context)
        .meals
        .where((meal) => meal.lunch == true)
        .toList();
    final supperMealsData = Provider.of<Meals>(context)
        .meals
        .where((meal) => meal.supper == true)
        .toList();

    String categoryText() {
      if (_pageIndex == 0) {
        return 'Breakfast';
      } else if (_pageIndex == 1) {
        return 'Lunch';
      } else if (_pageIndex == 2) {
        return 'Supper';
      }
      return 'Breakfast';
    }

    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        // Add Your Code here.
        var bf = Provider.of<Meals>(context, listen: false).breakfastMeal;
        var lunch = Provider.of<Meals>(context, listen: false).lunchMeal;
        var supper = Provider.of<Meals>(context, listen: false).supperMeal;

        if (bf.isNotEmpty) {
          _pageController.animateToPage(1,
              duration: const Duration(seconds: 1), curve: Curves.decelerate);
        }
        if (lunch.isNotEmpty) {
          _pageController.animateToPage(2,
              duration: const Duration(seconds: 1), curve: Curves.decelerate);
        }

        if (bf.isNotEmpty && lunch.isNotEmpty && supper.isNotEmpty) {
          showModalBottomSheet(
            enableDrag: false,
            isDismissible: false,
            context: context,
            builder: (context) {
              return WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Meals', style: kTitleTextStyle),
                      Container(
                        height: 160,
                        child: Row(
                          children: [
                            Expanded(
                              child: PickedMealCard(
                                imgPath: bf[0].imgPath,
                                meal: bf[0].title,
                              ),
                            ),
                            Expanded(
                              child: PickedMealCard(
                                imgPath: lunch[0].imgPath,
                                meal: lunch[0].title,
                              ),
                            ),
                            Expanded(
                              child: PickedMealCard(
                                imgPath: supper[0].imgPath,
                                meal: supper[0].title,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: CustomButton(
                          buttonLabel: 'Save',
                          click: () {
                            Provider.of<Meals>(context, listen: false)
                                .removeMeals();
                            Navigator.of(context).pop();
                          },
                          buttonWidth: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kPrimaryColor,
            automaticallyImplyLeading: false,
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.srcOver,
                color: Colors.black.withOpacity(0.3),
              ),
              title: const Text('Omnis Food', style: kBodyTextStyleWhite),
              centerTitle: false,
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(MdiIcons.accountCircle, size: 30),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(MdiIcons.calendar, color: kPrimaryColor),
                      const SizedBox(width: 10),
                      Text(
                        'January',
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        CurrentDayCard(isSelected: true, day: 1),
                        CurrentDayCard(isSelected: false, day: 2),
                        CurrentDayCard(isSelected: false, day: 3),
                        CurrentDayCard(isSelected: false, day: 4),
                        CurrentDayCard(isSelected: false, day: 5),
                        CurrentDayCard(isSelected: false, day: 6),
                        CurrentDayCard(isSelected: false, day: 7),
                        CurrentDayCard(isSelected: false, day: 8),
                        CurrentDayCard(isSelected: false, day: 9),
                        CurrentDayCard(isSelected: false, day: 10),
                        CurrentDayCard(isSelected: false, day: 11),
                        CurrentDayCard(isSelected: false, day: 12),
                        CurrentDayCard(isSelected: false, day: 13),
                        CurrentDayCard(isSelected: false, day: 14),
                        CurrentDayCard(isSelected: false, day: 15),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(MdiIcons.foodDrumstick, color: kPrimaryColor),
                      const SizedBox(width: 10),
                      Text(
                        'Meal',
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
                        TypeOfMealCard(
                          data: 'Breakfast',
                          isSelected: _pageIndex == 0,
                          onTap: () {
                            _pageController.animateToPage(0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate);
                          },
                        ),
                        TypeOfMealCard(
                          data: 'Lunch',
                          isSelected: _pageIndex == 1,
                          onTap: () {
                            _pageController.animateToPage(1,
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate);
                          },
                        ),
                        TypeOfMealCard(
                          data: 'Supper',
                          isSelected: _pageIndex == 2,
                          onTap: () {
                            _pageController.animateToPage(2,
                                duration: const Duration(seconds: 1),
                                curve: Curves.decelerate);
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(categoryText(), style: kBodyTextStyleBlack),
                    ],
                  ),
                  Container(
                    height: 500,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      children: [
                        BreakFastMealsSection(mealsData: breakfastMealsData),
                        LunchMealsSection(mealsData: lunchMealsData),
                        SupperMealsSection(mealsData: supperMealsData),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PickedMealCard extends StatelessWidget {
  final String imgPath;
  final String meal;
  const PickedMealCard({
    Key? key,
    required this.imgPath,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: kGreyishColor,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.12),
                  blurRadius: 6.0,
                  offset: const Offset(0.0, 3.0),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(meal, style: kBodyTextStyleBlack.copyWith(fontSize: 12)),
              Text('1200 kCal',
                  style: kBodyTextStyleGrey.copyWith(fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
