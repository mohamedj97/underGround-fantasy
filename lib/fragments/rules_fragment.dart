import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fantasy/widgets/rule_description.dart';
import 'package:fantasy/widgets/rule_title_list_tile.dart';

class TransitionsHomePage extends StatefulWidget {
  @override
  _TransitionsHomePageState createState() => _TransitionsHomePageState();
}

class _TransitionsHomePageState extends State<TransitionsHomePage> {
  int ruleNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  TransitionListTile(
                    title: 'Master-Branch',
                    onTap: () async{
                      setState(() {
                        ruleNumber=0;
                      });
                      await Future<void>.delayed(const Duration(milliseconds: 200));
                      timeDilation = 3;
                      showModalBottomSheet(context: context,
                          builder:(BuildContext context)=> OpenContainerTransformDemo(ruleNumber,'Master-Branch'));
                    },
                  ),
                  TransitionListTile(
                    title: 'Goals Conceded',
                    onTap: ()async{
                      setState(() {
                        ruleNumber=1;
                      });
                      await Future<void>.delayed(const Duration(milliseconds: 200));
                      timeDilation = 3;
                      showModalBottomSheet(context: context,
                          builder:(BuildContext context)=> OpenContainerTransformDemo(ruleNumber,'Goals Conceded'));
                    },
                  ),
                  TransitionListTile(
                    title: 'Goal keeping',
                    onTap: () async{
                      setState(() {
                        ruleNumber=2;
                      });
                      await Future<void>.delayed(const Duration(milliseconds: 200));
                      timeDilation = 3;
                      showModalBottomSheet(context: context,
                          builder:(BuildContext context)=> OpenContainerTransformDemo(ruleNumber,'Goal keeping'));
                    },
                  ),
                  TransitionListTile(
                    title: 'Groups/Join Groups',
                    onTap: () async{
                      setState(() {
                        ruleNumber=3;
                      });
                      await Future<void>.delayed(const Duration(milliseconds: 100));
                      timeDilation = 3;
                      showModalBottomSheet(context: context,
                          builder:(BuildContext context)=> OpenContainerTransformDemo(ruleNumber,'Groups/Join Groups'));
                    },
                  ),
                  TransitionListTile(
                    title: 'Squad-Instructions',
                    onTap: () async{
                      setState(() {
                        ruleNumber=4;
                      });
                      await Future<void>.delayed(const Duration(milliseconds: 100));
                      timeDilation = 3;
                      showModalBottomSheet(
                          context: context,
                          builder:(context)=> OpenContainerTransformDemo(ruleNumber,'Squad-Instructions'));
                    },
                  ),
                  TransitionListTile(
                    title: 'Notifications',
                    onTap: () async{
                      setState(() {
                        ruleNumber=5;
                      });
                      await Future<void>.delayed(const Duration(milliseconds: 100));
                      timeDilation = 3;
                      showModalBottomSheet(context: context,
                          builder:(context)=> OpenContainerTransformDemo(ruleNumber,'Notifications'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

