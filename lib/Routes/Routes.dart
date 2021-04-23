import 'package:api/Models/Route.dart';
import 'package:api/Pages/details.dart';
import 'package:api/Pages/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Details':
        return MaterialPageRoute(
            builder: (_) => Details(routeArgument: args as RouteArgument));
      case '/Home':
        return MaterialPageRoute(builder: (_) => Homescreen());
    }
  }
}
