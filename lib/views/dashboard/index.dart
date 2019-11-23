import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';
import 'package:flutter_sample/services/auth_service.dart';
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
        final response = await AuthService.signOut();
        Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(
                builder: (context) => new ViewLaunchIndex()),
            (_) => false);
      } on DioError catch(e) {
        print(e);
      }
    }
    var listItem = [1, 2, 3];

    Future<void> _refresh() async {
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        listItem = listItem.map((item) => item + 1).toList();
      });
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
        body: RefreshIndicator(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Padding(
                          child: Text(listItem[index].toString(), style: TextStyle(fontSize: 22.0),),
                          padding: EdgeInsets.all(20.0),),
                  );},
                  itemCount: listItem.length,
            ),
            onRefresh: _refresh,
        ),
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
