import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fantasy/pages/auth.dart';

class LoadingPage extends StatefulWidget {
  static const String id='LoadingPage';
  @override
  _LoadingPageState createState() => new _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 7),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => AuthPage())));


    return SafeArea(
      child: new Scaffold(
      body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset("assets/giphy.gif",fit: BoxFit.fill,width: 200,),

      
        ),

      ),
    );
  }
}
