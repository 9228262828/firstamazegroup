
import 'package:firstamazegroup/view/home.dart';
import 'package:flutter/material.dart';
import 'app_strings.dart';

class Routes {
  static const String splash = '/';
  static const String homeScreen = '/homeScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String registerScreen = '/registerScreen';
  static const String loginScreen = '/loginScreen';
  static const String verifyAccountScreen = '/verifyAccountScreen';
  static const String forgotPassword = '/forgotPassword';
  static const String account = '/account';
  static const String settingsScreen = '/settingsScreen';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes. homeScreen:
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen(),
        );


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.wrongScreen),
        ),
        body: const Center(child: Text(AppStrings.routeNotFound)),
      ),
    );
  }
}
