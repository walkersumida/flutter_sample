import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';
import 'package:flutter_sample/views/widgets/custom_dialog.dart';
import 'package:flutter_sample/views/launch/index.dart';

class ViewDashboardIndex extends StatefulWidget {
  ViewDashboardIndex({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ViewDashboardIndexState createState() => _ViewDashboardIndexState();
}

class _ViewDashboardIndexState extends State<ViewDashboardIndex> {
  CustomDialog dialog = new CustomDialog();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    _fetchSignOut(context) async {
      try {
        final response =
            await dio.delete('/auth/sign_out');
        Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(
                builder: (context) => new ViewLaunchIndex()),
            (_) => false);
      } on DioError catch(e) {
        print(e);
      }
    }

    return Scaffold(
        appBar: AppBar(
            title: const Text('Dashboad'),
            leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () { Scaffold.of(context).openDrawer(); },
                      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
            ),
        ),
        body: Center(
            child: Container(
                color: Colors.white,
            )),
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                      ),
                  ),
                  ListTile(
                      title: Text('Sign Out'),
                      onTap: () {
                        Navigator.pop(context);
                        _fetchSignOut(context);
                      },
                  ),
                ]
            )
        ));
  }
}
