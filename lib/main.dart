import 'package:flutter/material.dart';
import 'package:mealime/providers/allergies.dart';
import 'package:mealime/providers/diets.dart';
import 'package:mealime/providers/dislikes.dart';
import 'package:mealime/screens/intro_screen.dart';
import 'package:mealime/screens/select_allergies_screen.dart';
import 'package:mealime/screens/select_diet_screen.dart';
import 'package:mealime/screens/select_dislikes_screen.dart';
import 'package:mealime/screens/servings_screen.dart';
import 'package:mealime/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MeaLime());
}

class MeaLime extends StatelessWidget {
  const MeaLime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Diets()),
        ChangeNotifierProvider(create: (context) => Allergies()),
        ChangeNotifierProvider(create: (context) => Dislikes()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Catamaran',
        ),
        home: Container(),
        initialRoute: WelcomeScreen.routeName,
        routes: {
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          IntroScreen.routeName: (context) => const IntroScreen(),
          SelectDietScreen.routeName: (context) => const SelectDietScreen(),
          SelectAllergiesScreen.routeName: (context) =>
              const SelectAllergiesScreen(),
          SelectDislikesScreen.routeName: (context) =>
              const SelectDislikesScreen(),
          ServingsScreen.routeName: (context) => const ServingsScreen(),
        },
      ),
    );
  }
}
