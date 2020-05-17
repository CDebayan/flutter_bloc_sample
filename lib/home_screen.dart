import 'package:flutter/material.dart';
import 'package:flutterblocsample/counter1/counter1_screen.dart';
import 'package:flutterblocsample/counter2/counter2_screen.dart';
import 'package:flutterblocsample/login1/login1_screen.dart';
import 'package:flutterblocsample/login2/login2_screen.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(child: Text("Counter 1"),onPressed: () {
                Navigator.of(context).pushNamed(Counter1Screen.routeName);
              }),
              RaisedButton(child: Text("Counter 2"),onPressed: () {
                Navigator.of(context).pushNamed(Counter2Screen.routeName);
              }),
              RaisedButton(child: Text("Login1"),onPressed: () {
                Navigator.of(context).pushNamed(Login1Screen.routeName);
              }),
              RaisedButton(child: Text("Login2"),onPressed: () {
                Navigator.of(context).pushNamed(Login2Screen.routeName);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
