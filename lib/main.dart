import 'package:fantasy/pages/auth.dart';
import 'package:fantasy/pages/home.dart';
import 'package:fantasy/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UG Fantasy',
      theme: ThemeData(
        brightness:Brightness.dark,
      ),
      home: HomePage(),

      routes: {
        AuthPage.id :(BuildContext context) =>AuthPage(),
        HomePage.id :(BuildContext context) =>HomePage(),
        LoadingPage.id :(BuildContext context) =>LoadingPage(),
      },

    );
  }
}

