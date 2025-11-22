import 'package:flutter/material.dart';
import 'package:newsapp/core/routes/app_routes_name.dart';
import 'package:newsapp/modules/splashScreen/pages/splashScreen.dart';

import 'core/routes/route_gen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      onGenerateRoute: RouteGen.onGenerateRoute,
      initialRoute: RouteName.Splash,


    );
  }
}
