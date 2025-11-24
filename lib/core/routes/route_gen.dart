
import 'package:flutter/material.dart';
import 'package:newsapp/modules/splashScreen/pages/splashScreen.dart';

import '../../modules/layoutScreens/pages/layoutScreen.dart';
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

      case RouteName.Layout:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return LayoutScreen();
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
