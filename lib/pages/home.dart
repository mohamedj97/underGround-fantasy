import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../fragments/home_fragment.dart';
import 'package:fantasy/fragments/rules_fragment.dart';
import 'package:fantasy/fragments/groups_fragment.dart';
import 'package:fantasy/fragments/profile.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final _tabs = [
    HomeFragment(),
    Container(child: Center(child: Text('Matches'),),),
    GroupsFragment(),
    HomeRulesFragment(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Champ'),
      ),
      body:Stack(children: <Widget>[
        Container(
          decoration: kBackGroundContainerDecoration,
          height: double.infinity,
          width: double.infinity,
        ),
        _tabs[_currentIndex],
      ],),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Colors.black,
        index: _currentIndex,
        buttonBackgroundColor: Colors.grey,
        backgroundColor: Colors.grey[900],
        animationDuration: Duration(milliseconds: 400),
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
//              Container(
//                padding: EdgeInsets.all(1),
//                decoration: new BoxDecoration(
//                  color: Colors.red,
//                  borderRadius: BorderRadius.circular(6),
//                ),
//                constraints: BoxConstraints(
//                  minWidth: 12,
//                  minHeight: 12,
//                ),
//                child: new Text(
//                  '$_counter',
//                  style: new TextStyle(color: Colors.white,fontSize: 20),
//                  textAlign: TextAlign.center,
//                ),
//              ),
              Icon(Icons.home, size: 30,),
              Text('Home')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.brightness_1, size: 30),
              Text('Matches')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.people, size: 30),
              Text('Groups')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.receipt, size: 30),
              Text('Rules')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.account_circle, size: 30),
              Text('Me')
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            print(_currentIndex.toString());
            _currentIndex = index;
          });
        },
      ),

    );
  }
}
