import 'package:flutter/material.dart';
import 'package:mealime/constants/colors.dart';
import 'package:mealime/constants/constants.dart';
import 'package:mealime/screens/groceries_nav_screen.dart';
import 'package:mealime/widgets/custom_button.dart';

import 'meal_plan_nav_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = const [
    MealPlanNavScreen(),
    GroceriesNavScreen(),
    Center(child: Text('Favorites')),
    Center(child: Text('Settings')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        showUnselectedLabels: false,
        selectedLabelStyle: kBodyTextStylePrimary.copyWith(
            fontWeight: FontWeight.normal, fontSize: 14),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            label: 'Meal Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_rounded),
            label: 'Groceries',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: kPrimaryColor,
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            )
          : const SizedBox(),
    );
  }
}
