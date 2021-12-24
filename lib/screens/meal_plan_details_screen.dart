import 'package:flutter/material.dart';

class MealPlanDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-plan-details-screen';
  const MealPlanDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 200,
          ),
        ],
      ),
    );
  }
}
