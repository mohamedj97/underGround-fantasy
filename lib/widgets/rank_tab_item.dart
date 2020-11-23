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
      height: 60,
      padding: EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        elevation: 10,
        color: Colors.white70,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 5,
                left: 5,
                child: Text(position.toString(),style: kLabelGroupStyle)),
            Positioned(
                top: 5,
                left: 80,
                child: Text(teamName,style: kLabelGroupStyle)),
            Positioned(
                top: 5,
                left: 245,
                child: Text(lastPoints.toString(),style: kLabelGroupStyle)),
            Positioned(
                top: 5,
                left: 315,
                child: Text(totalPoints.toString(),style: kLabelGroupStyle)),
          ],
        ),
      ),
    );
  }
}