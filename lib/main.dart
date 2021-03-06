import 'package:fantasy/pages/auth.dart';
import 'package:fantasy/pages/home.dart';
import 'package:fantasy/pages/loading.dart';
import 'package:fantasy/widgets/notification_layout.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/pages/SplashScreen.dart';
import 'package:fantasy/pages/group_page.dart';
import 'package:fantasy/pages/set_member_points.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UG Fantasysssssss',
      theme: ThemeData(
        brightness:Brightness.dark,
      ),
      home: AuthPage(),

      routes: {
        AuthPage.id :(BuildContext context) =>AuthPage(),
        HomePage.id :(BuildContext context) =>HomePage(),
        LoadingPage.id :(BuildContext context) =>LoadingPage(),
        SplashScreen.id :(BuildContext context) =>SplashScreen(),
        GroupPage.id :(BuildContext context) =>GroupPage(),
        SetMemberPoints.id :(BuildContext context) =>SetMemberPoints(),
      },
    );
  }
}

