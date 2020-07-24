import 'package:flutter/material.dart';
import 'package:fantasy/widgets/group_item_list.dart';
import 'package:flutter/scheduler.dart';
import 'package:animations/animations.dart';
import 'package:fantasy/widgets/create_or_add_group.dart';

const double _fabDimension = 56.0;

class GroupsFragment extends StatefulWidget {
  @override
  _GroupsFragmentState createState() => _GroupsFragmentState();
}

class _GroupsFragmentState extends State<GroupsFragment> {

  ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  List<String> groupsNames=['Group1','Group2','Group3','Group4','Group5','Group6','Group7','Group8','Group9','Group10','Group11','Group12'];
  List<String> groupOwners=['Mohamed Gamal','Gasser Ashraf','Amr Mohamed','Mohamed Gamal','Gasser Ashraf','Amr Mohamed','Mohamed Gamal','Gasser Ashraf','Amr Mohamed','Mohamed Gamal','Gasser Ashraf','Amr Mohamed'];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView.builder(
              itemCount: groupsNames.length,
              itemBuilder: (context,index){
                return GroupItemList(groupsNames[index], 'by: ${groupOwners[index]}');
              }),
      floatingActionButton: OpenContainer (
        transitionType: _transitionType,
        openBuilder: (BuildContext context, VoidCallback _) {
          timeDilation = 3;
          return const CreatingOrAddingGroup(
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
    );
  }
}