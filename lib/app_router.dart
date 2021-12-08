import 'package:flutter/material.dart';
import 'package:login/view/home.dart';
import 'package:login/view/login.dart';
import 'package:login/utils/strings.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      switch (routeSettings.name) {
        case '/':
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) {
              return Login();
            },
          );
        case myHomePage:
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => Home(),
          );

        default:
          return errorRoute(routeSettings);
      }
    } catch (_) {
      return errorRoute(routeSettings);
    }
  }

  static Route<dynamic> errorRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(settings: routeSettings, builder: (_) => Login());
  }
}
