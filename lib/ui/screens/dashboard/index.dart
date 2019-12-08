import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample/config/dio.dart';
import 'package:flutter_sample/resources/repositories/auth_repository.dart';
import 'package:flutter_sample/ui/widgets/custom_dialog.dart';
import 'package:flutter_sample/ui/screens/launch/index.dart';
import 'package:flutter_sample/blocs/auth_bloc.dart';
import 'package:flutter_sample/models/user.dart';
import 'package:flutter_sample/models/user_response.dart';

class ViewDashboardIndex extends StatefulWidget {
  ViewDashboardIndex({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ViewDashboardIndexState createState() => _ViewDashboardIndexState();
}

class _ViewDashboardIndexState extends State<ViewDashboardIndex> {
  AuthBloc _authBloc = AuthBloc();
  CustomDialog dialog = new CustomDialog();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    _fetchSignOut(context) {
      try {
        AuthRepository _authRepository = AuthRepository();
        final response = _authRepository.signOut();
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
                  new StreamBuilder(
                      stream: _authBloc.getUser,
                      builder: (context, AsyncSnapshot<UserResponse> snapshot){
                        // HACK: snapshot.data becomes null when open sidebar
                        if (snapshot.data == null) {
                          return DrawerHeader();
                        }
                        return new DrawerHeader(
                            child: Text(snapshot.data.data.name),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                            ),
                        );
                      }),
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
