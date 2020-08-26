import 'package:fantasy/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/tabs/group/rank_table.dart';
import 'package:fantasy/tabs/group/squad_tab.dart';
import 'package:fantasy/tabs/group/members_tab.dart';

class GroupPage extends StatefulWidget {

  static const String id = 'GroupPage';

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final Transfers transfersMode=Transfers.Off;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UG Fantasy',
      theme: ThemeData.dark(),
      home: DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          title: Text('Blah Blah Group'),
          bottom: TabBar(tabs: [
            Tab(text: 'Squad',icon:Icon(Icons.brightness_1),),
            Tab(text: 'Members',icon:Icon(Icons.group),),
            Tab(text: 'Rank',icon:Icon(Icons.format_list_numbered),),
          ]),
        ),
        body: TabBarView(children: [
          SquadTab(),
          MembersTab(playerOutName: '',transfersMode: transfersMode,),
          RankTab(),
        ]),
      )),
    );
  }
}
