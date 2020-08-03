import 'package:flutter/material.dart';

class RankTabItem extends StatelessWidget {
  final String title;
  RankTabItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          ListTile(leading: Text('1'),title: Text(title),trailing: Text('50'),)
        ],
      ),
    );
  }
}