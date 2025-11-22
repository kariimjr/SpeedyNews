
import 'package:flutter/material.dart';
import 'package:newsapp/modules/homeScreen/pages/homeScreen.dart';
import 'package:newsapp/modules/splashScreen/pages/splashScreen.dart';

import 'app_routes_name.dart';
//
class RouteGen {
  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {

      case RouteName.Splash:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return SplashScreen();
          },
        );

      case RouteName.Home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return homeScreen();
          },
        );

      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SplashScreen(),
        );
    }
  }
}
