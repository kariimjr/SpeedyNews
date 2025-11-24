
import 'package:flutter/material.dart';
import 'package:newsapp/modules/layoutScreens/pages/layoutScreen.dart';
import 'package:newsapp/modules/splashScreen/pages/splashScreen.dart';

import '../../modules/authentication/pages/createAccountScreen.dart';
import '../../modules/authentication/pages/forgetPassword.dart';
import '../../modules/authentication/pages/login_screen.dart';
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
            return LayoutScreenV2();
          },
        );

      case RouteName.Login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return LoginScreen();
          },
        );
      case RouteName.Forget:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ForgetPassword();
          },
        );
      case RouteName.CreateAccount:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return CreateAccountScreen();
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
