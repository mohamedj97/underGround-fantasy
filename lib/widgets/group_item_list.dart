import 'package:fantasy/pages/group_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class GroupItemList extends StatelessWidget {
  final String groupName;
  final String groupOwner;
  final String groupCode;

  GroupItemList(this.groupName, this.groupOwner, this.groupCode);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: Color.fromRGBO(64, 75, 96, .9),
        child: ListTile(
          title: Text(
            groupName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(groupOwner),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            timeDilation = 3;
            Navigator.pushNamed(context, GroupPage.id,
                arguments: {'groupName': groupName, 'groupCode': groupCode});
          },
        ),
      ),
    );
  }
}
