import 'package:flutter/material.dart';
import 'package:flutter_sample/config/router.dart';
import 'package:flutter_sample/ui/screens/launch/index.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
        title: 'Flutter Sample',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: ViewLaunchIndex(title: 'Flutter Sample Login Page'),
    );
  }
}
