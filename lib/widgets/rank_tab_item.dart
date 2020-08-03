import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';

class RankTabItem extends StatelessWidget {
  final String teamName;
  final int position;
  final int lastPoints;
  final int totalPoints;


  RankTabItem({this.teamName, this.position, this.lastPoints, this.totalPoints});

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                    child: Text(position.toString(),style: kLabelGroupStyle),
                  ),
                  SizedBox(width: 110),
                  Text(teamName,style: kLabelGroupStyle),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(lastPoints.toString(),style: kLabelGroupStyle),
                  SizedBox(width: 45),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,8,0),
                    child: Text(totalPoints.toString(),style: kLabelGroupStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}