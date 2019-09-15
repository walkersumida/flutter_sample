import 'package:flutter/material.dart';
import 'package:flutter_sample/views/launch/index.dart';
import 'package:flutter_sample/views/dashboard/index.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ViewLaunchIndex());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => ViewDashboardIndex());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
