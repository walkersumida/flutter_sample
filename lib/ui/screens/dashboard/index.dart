import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample/resources/repositories/auth_repository.dart';
import 'package:flutter_sample/ui/widgets/custom_dialog.dart';
import 'package:flutter_sample/ui/screens/launch/index.dart';
import 'package:flutter_sample/blocs/auth_bloc.dart';
import 'package:flutter_sample/blocs/post_bloc.dart';
import 'package:flutter_sample/models/user_response.dart';
import 'package:flutter_sample/models/posts_response.dart';

class ViewDashboardIndex extends StatefulWidget {
  ViewDashboardIndex({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ViewDashboardIndexState createState() => _ViewDashboardIndexState();
}

class _ViewDashboardIndexState extends State<ViewDashboardIndex> {
  AuthBloc _authBloc = AuthBloc();
  PostBloc _postBloc = PostBloc();
  CustomDialog dialog = new CustomDialog();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  _fetchSignOut(context) {
    try {
      AuthRepository _authRepository = AuthRepository();
      _authRepository.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          new MaterialPageRoute(
              builder: (context) => new ViewLaunchIndex()),
          (_) => false);
    } on DioError catch(e) {
      print(e);
    }
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));

    _postBloc.index();
  }

  @override
  Widget build(BuildContext context) {
    _postBloc.index();

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
        body: new StreamBuilder(
            stream: _postBloc.getPosts,
            builder: (context, AsyncSnapshot<PostsResponse> snapshot){
              // HACK: snapshot.data becomes null when open page
              if (snapshot.data == null) {
                return Card();
              }
              return RefreshIndicator(
                  child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: Padding(
                                child: Text(snapshot.data.data[index].title, style: TextStyle(fontSize: 22.0),),
                                padding: EdgeInsets.all(20.0),),
                        );},
                        itemCount: snapshot.data.data.length,
                  ),
                  onRefresh: _refresh,
              );}),
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
