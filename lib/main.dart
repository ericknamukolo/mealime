import 'package:flutter/material.dart';
import 'package:mealime/screens/intro_screen.dart';
import 'package:mealime/screens/select_diet_screen.dart';
import 'package:mealime/screens/welcome_screen.dart';

void main() {
  runApp(const MeaLime());
}

class MeaLime extends StatelessWidget {
  const MeaLime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Catamaran',
      ),
      home: Container(),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        IntroScreen.routeName: (context) => const IntroScreen(),
        SelectDietScreen.routeName: (context) => const SelectDietScreen(),
      },
    );
  }
}
