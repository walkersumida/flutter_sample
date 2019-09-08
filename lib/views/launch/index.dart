import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sample/plugins/dio.dart';
import 'package:flutter_sample/views/widgets/custom_dialog.dart';

class ViewLaunchIndex extends StatefulWidget {
  ViewLaunchIndex({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ViewLaunchIndexState createState() => _ViewLaunchIndexState();
}

class _ViewLaunchIndexState extends State<ViewLaunchIndex> {
  CustomDialog dialog = new CustomDialog();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    fetchAuth() async {
      try {
        final response =
            await dio.post('/auth/sign_in',
                data: { 'email': _email, 'password': _password });

        // TODO: move to dashboard
        dialog.show(context, 'successed');
        return json.decode(response.data);
      } on DioError catch(e) {
        dialog.show(context, 'failed');
        throw Exception('Failed to load post');
      }
    }

    void login() {
      fetchAuth();
    }
    final emailField = TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onChanged: (value) {
          setState(() {
            _email = value;
          });
        },
    );
    final passwordField = TextField(
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        onChanged: (value) {
          setState(() {
            _password = value;
          });
        },
    );
    final loginButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () { login(); },
            child: Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
        ),
    );

    return Scaffold(
        body: Center(
            child: Container(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: 80.0,
                              child: Image.asset(
                                  "images/logo_flutter.png",
                                  fit: BoxFit.contain,
                              ),
                          ),
                          SizedBox(height: 30.0),
                          emailField,
                          SizedBox(height: 10.0),
                          passwordField,
                          SizedBox(height: 35.0),
                          loginButon,
                          SizedBox(height: 15.0),
                        ])))));
  }
}

