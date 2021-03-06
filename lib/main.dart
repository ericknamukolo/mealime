import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mealime/providers/allergies.dart';
import 'package:mealime/providers/auth.dart';
import 'package:mealime/providers/groceries.dart';
import 'package:mealime/providers/meals.dart';
import 'package:mealime/providers/package_packs.dart';
import 'package:mealime/screens/choose_package_screen.dart';
import 'package:mealime/screens/home_screen.dart';
import 'package:mealime/screens/intro_screen.dart';
import 'package:mealime/screens/meal_plan_details_screen.dart';
import 'package:mealime/screens/meal_plan_screen.dart';
import 'package:mealime/screens/mobile_verification.dart';
import 'package:mealime/screens/payment_screen.dart';
import 'package:mealime/screens/personal_details_screen.dart';
import 'package:mealime/screens/mobile_registration.dart';
import 'package:mealime/screens/sign_in_screen.dart';
import 'package:mealime/screens/signup_screen.dart';
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
        ChangeNotifierProvider(create: (context) => Allergies()),
        ChangeNotifierProvider(create: (context) => Groceries()),
        ChangeNotifierProvider(create: (context) => Meals()),
        ChangeNotifierProvider(create: (context) => Packages()),
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          fontFamily: 'Catamaran',
        ),
        initialRoute: WelcomeScreen.routeName,
        routes: {
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          IntroScreen.routeName: (context) => const IntroScreen(),
          MobileRegistration.routeName: (context) => const MobileRegistration(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          MealPlanScreen.routeName: (context) => const MealPlanScreen(),
          MealPlanDetailsScreen.routeName: (context) =>
              const MealPlanDetailsScreen(),
          MobileVerificationScreen.routeName: (context) =>
              const MobileVerificationScreen(),
          PersonalDetailsScreen.routeName: (context) =>
              const PersonalDetailsScreen(),
          ChoosePackageScreen.routeName: (context) =>
              const ChoosePackageScreen(),
          PaymentScreen.routeName: (context) => const PaymentScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
        },
      ),
    );
  }
}
