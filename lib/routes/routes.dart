import 'package:denuncia_v1/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static const initialRoute = 'loginScreen';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoute = {};

    appRoute.addAll({
      "loginScreen": (BuildContext context) => const LoginScreen(),
    });
    appRoute.addAll({
      "onBoardingScreen": (BuildContext context) => const OnBoardingScreen(),
    });
    appRoute.addAll({
      "homeScreen": (BuildContext context) => const HomeScreen(),
    });
    return appRoute;
  }
}
