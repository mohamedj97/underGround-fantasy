import 'package:flutter/material.dart';

class GroupsFragment extends StatefulWidget {
  @override
  _GroupsFragmentState createState() => _GroupsFragmentState();
}

class _GroupsFragmentState extends State<GroupsFragment> {

  List<String> groupsNames=['Group1','Group2','Group3'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: groupsNames.length,
        itemBuilder: (context,index){
          return Padding(
              padding:const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
          child: Card(
            child: Text(groupsNames[index]),
          ),);
        });
  }
}
