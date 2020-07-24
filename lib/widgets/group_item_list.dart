import 'package:flutter/material.dart';

class GroupItemList extends StatelessWidget {
  final String groupName;
  final String groupOwner;

  GroupItemList(this.groupName, this.groupOwner);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: Color.fromRGBO(64, 75, 96, .9),
        child: ListTile(title: Text(groupName,style: TextStyle(fontWeight: FontWeight.bold),)
            ,subtitle:Text(groupOwner),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => OpenContainerTransformDemo()));
        },),
      ),
    );
  }
}
