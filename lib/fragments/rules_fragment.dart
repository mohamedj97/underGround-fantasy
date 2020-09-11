import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fantasy/widgets/rule_description.dart';
import 'package:fantasy/widgets/rule_title_list_tile.dart';

class HomeRulesFragment extends StatefulWidget {
  @override
  _HomeRulesFragmentState createState() => _HomeRulesFragmentState();
}

class _HomeRulesFragmentState extends State<HomeRulesFragment> {
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
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    child: RuleListTile(
                      title: 'Master-Branch',
                      onTap: () async{
                        setState(() {
                          ruleNumber=0;
                        });
                        await Future<void>.delayed(const Duration(milliseconds: 200));
                        timeDilation = 3;
                        showModalBottomSheet(context: context,
                            builder:(BuildContext context)=> RuleDescriptionModal(ruleNumber,'Master-Branch'));
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    child: RuleListTile(
                      title: 'Goals Conceded',
                      onTap: ()async{
                        setState(() {
                          ruleNumber=1;
                        });
                        await Future<void>.delayed(const Duration(milliseconds: 200));
                        timeDilation = 3;
                        showModalBottomSheet(context: context,
                            builder:(BuildContext context)=> RuleDescriptionModal(ruleNumber,'Goals Conceded'));
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    child: RuleListTile(
                      title: 'Goal keeping',
                      onTap: () async{
                        setState(() {
                          ruleNumber=2;
                        });
                        await Future<void>.delayed(const Duration(milliseconds: 200));
                        timeDilation = 3;
                        showModalBottomSheet(context: context,
                            builder:(BuildContext context)=> RuleDescriptionModal(ruleNumber,'Goal keeping'));
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    child: RuleListTile(
                      title: 'Groups/Join Groups',
                      onTap: () async{
                        setState(() {
                          ruleNumber=3;
                        });
                        await Future<void>.delayed(const Duration(milliseconds: 100));
                        timeDilation = 3;
                        showModalBottomSheet(context: context,
                            builder:(BuildContext context)=> RuleDescriptionModal(ruleNumber,'Groups/Join Groups'));
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    child: RuleListTile(
                      title: 'Squad-Instructions',
                      onTap: () async{
                        setState(() {
                          ruleNumber=4;
                        });
                        await Future<void>.delayed(const Duration(milliseconds: 100));
                        timeDilation = 3;
                        showModalBottomSheet(
                            context: context,
                            builder:(context)=> RuleDescriptionModal(ruleNumber,'Squad-Instructions'));
                      },
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                    child: RuleListTile(
                      title: 'notifications',
                      onTap: () async{
                        setState(() {
                          ruleNumber=5;
                        });
                        await Future<void>.delayed(const Duration(milliseconds: 100));
                        timeDilation = 3;
                        showModalBottomSheet(context: context,
                            builder:(context)=> RuleDescriptionModal(ruleNumber,'Notifications'));
                      },
                    ),
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

