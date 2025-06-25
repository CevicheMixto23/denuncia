import 'package:denuncia_v1/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static const initialRoute = 'loginScreen';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoute = {};
    final user = FirebaseAuth.instance.currentUser;

    appRoute.addAll({
      "loginScreen": (BuildContext context) => const LoginScreen(),
    });
    appRoute.addAll({
      "onBoardingScreen": (BuildContext context) => const OnBoardingScreen(),
    });
    appRoute.addAll({
      "homeScreen": (BuildContext context) => const HomeScreen(),
    });
    appRoute.addAll({
      "chatbotScreen": (BuildContext context) => const ChatbotScreen(),
    });
    return appRoute;
  }
}
