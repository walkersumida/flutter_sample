import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';
import 'package:flutter_sample/router.dart';
import 'package:flutter_sample/views/launch/index.dart';

void main() {
  addDioInterceptors();

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
