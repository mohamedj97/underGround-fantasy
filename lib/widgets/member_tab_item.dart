import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';

class MemberTabListItem extends StatelessWidget {
  final String memberName;
  final int lastScore;
  final int overallScore;
  MemberTabListItem({this.memberName,this.lastScore,this.overallScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        elevation: 10,
        color: Colors.white70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(memberName,style: kLabelGroupStyle),
            ),
            Row(
              children: <Widget>[
                Text(lastScore.toString(),style: kLabelGroupStyle),
                SizedBox(width: 90),
                Text(overallScore.toString(),style: kLabelGroupStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
