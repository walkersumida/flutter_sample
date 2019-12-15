import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/screens/launch/index.dart';
import 'package:flutter_sample/ui/screens/dashboard/index.dart';
import 'package:flutter_sample/ui/screens/posts/new.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ViewLaunchIndex());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => ViewDashboardIndex());
      case '/postNew':
        return _routePostNew();
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
            ));
    }
  }

  static PageRouteBuilder _routePostNew() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ViewPostNew(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
