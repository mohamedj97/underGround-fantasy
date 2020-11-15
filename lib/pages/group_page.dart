import 'package:fantasy/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter/scheduler.dart';
import 'package:fantasy/tabs/group/rank_table.dart';
import 'package:fantasy/tabs/group/squad_tab.dart';
import 'package:fantasy/tabs/group/members_tab.dart';
import 'package:fantasy/widgets/match_notification_body.dart';
import 'package:share/share.dart';

const double _fabDimension = 56.0;

class GroupPage extends StatefulWidget {

  static const String id = 'GroupPage';

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  final Transfers transfersMode=Transfers.Off;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UG Fantasy',
      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: OpenContainer (
          transitionType: _transitionType,
          openBuilder: (BuildContext context, VoidCallback _) {
            timeDilation = 3;
            return const MatchNotification(
              includeMarkAsDoneButton: false,
            );
          },
          closedElevation: 6.0,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(_fabDimension / 2),
            ),
          ),
          closedColor: Theme.of(context).colorScheme.secondary,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return SizedBox(
              height: _fabDimension,
              width: _fabDimension,
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            );
          },
        ),
        body: DefaultTabController(length: 3, child: Scaffold(
          appBar: AppBar(
            title: Text('Blah Blah Group'),
            bottom: TabBar(tabs: [
              Tab(text: 'Squad',icon:Icon(Icons.brightness_1),),
              Tab(text: 'Members',icon:Icon(Icons.group),),
              Tab(text: 'Rank',icon:Icon(Icons.format_list_numbered),),
            ]),
             actions: <Widget>[
               Container(
                   padding: EdgeInsets.only(right: 20),
                   child: GestureDetector(

                     child: Icon(Icons.share),
                     onTap:(){
                       Share.share("Hello");

                     },

                   ))
             ],
          ),
          body: TabBarView(children: [
            SquadTab(),
            MembersTab(playerOutName: '',transfersMode: transfersMode,),
            RankTab(),
          ]),
        )),
      ),
    );
  }
}
