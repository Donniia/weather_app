import 'package:flutter/material.dart';
import 'package:weather_app/Core/utils/routes_manager/routes.dart';
import 'package:weather_app/Presentation/screens/splashScreen.dart';

import '../../../Presentation/screens/Auth/sign_in.dart';
import '../../../Presentation/screens/Auth/sign_up.dart';
import '../../../Presentation/screens/Home/home_Screen.dart';
import '../../../Presentation/screens/start_screen.dart';

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => SplashScreen());
        }
      case Routes.startScreenRoute:
        {
          return MaterialPageRoute(builder: (_) => StartScreen());
        }
      case Routes.signInRoute:
        {
          return MaterialPageRoute(builder: (_) => SignInScreen());
        }
      case Routes.signupRoute:
        {
          return MaterialPageRoute(builder: (_) => SignUpScreen());
        }
      case Routes.homeRoute:
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
