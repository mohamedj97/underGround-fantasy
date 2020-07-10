import 'package:flutter/material.dart';

class OpenContainerTransformDemo extends StatelessWidget {

  final int ruleNumber;
  final String ruleName;
  OpenContainerTransformDemo(this.ruleNumber,this.ruleName);

  final List<String> _tabs = [

'Only one Master in each Group and he the only one who ables to put points to all members in Group',

'All your team will be minus one for each 4 goals',

'There is no direct keeper and it will be calculated as rule "Goals Conceded"',

'You able to be in multiple Groups and one squad for one group \n '
    'Once the Master created the Group he will get code and share it with his team mates',

'Only 5 members in the team and one Transfer per Match for each squad',

'Next Match will be written and shared by the Master and Branches view it in Home',

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30),
            topRight: const Radius.circular(30),
          )
        ),
        child: Text(_tabs[ruleNumber],
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),),
      );
  }
}



