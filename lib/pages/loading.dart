import 'package:flutter/material.dart';


class LoadingPage extends StatefulWidget {
  static const String id='LoadingPage';
  @override
  _LoadingPageState createState() => new _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  Widget build(BuildContext context) {
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
