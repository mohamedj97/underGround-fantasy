import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';


class SplashScreen extends StatefulWidget {
  static const String id='SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

  }
  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Color(0xff7f00ff),
                highlightColor: Color(0xffe100ff),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Underground Fantasy",
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12)
                          )
                        ]
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}