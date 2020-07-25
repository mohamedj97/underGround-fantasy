import 'package:flutter/material.dart';

class SquadTab extends StatefulWidget {
  @override
  _SquadTabState createState() => _SquadTabState();
}

class _SquadTabState extends State<SquadTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/squad.png'),
          fit: BoxFit.fill)
        ),
      ),
    );
  }
}
