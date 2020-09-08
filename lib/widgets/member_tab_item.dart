import 'package:fantasy/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:fantasy/models/user_type.dart';
import 'package:fantasy/pages/set_member_points.dart';

class MemberTabListItem extends StatefulWidget {
  final String memberName;
  final Transfers transfersMode;
  final String playerOutName;
  final int lastScore;
  final int overallScore;
  final int price;
  MemberTabListItem({this.memberName,this.lastScore,this.overallScore,this.price,this.playerOutName,this.transfersMode});

  @override
  _MemberTabListItemState createState() => _MemberTabListItemState();
}

class _MemberTabListItemState extends State<MemberTabListItem> {

  UserType _userType =UserType.Master;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_userType==UserType.Master)
          {
            showModalBottomSheet(context: context,
              builder:(BuildContext context)=> SetMemberPoints());
          }

            print('Do you want to replace ${widget.playerOutName} with ${widget.memberName}');

        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
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
                    Text(widget.memberName,style: kLabelGroupStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('${widget.price.toString()} \$',style: kLabelGroupStyle),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(widget.lastScore.toString(),style: kLabelGroupStyle),
                    SizedBox(width: 55),
                    Text(widget.overallScore.toString(),style: kLabelGroupStyle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
