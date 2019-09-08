import 'package:flutter/material.dart';
import 'package:flutter_sample/views/launch/index.dart';

void main() => runApp(_MyApp());

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Sample',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: ViewLaunchIndex(title: 'Flutter Sample Login Page'),
    );
  }
}
