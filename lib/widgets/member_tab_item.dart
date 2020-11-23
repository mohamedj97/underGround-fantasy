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


AlertDialog transfer_Player(String player1,String player2){
  return AlertDialog(
    title:Text("Transfer"),
    content: Text("Do you Want to replace $player1 with $player2 ??"),
    actions: <Widget>[
      FlatButton(onPressed: (){}, child: Text("No"),color: Colors.red,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),),
      FlatButton(onPressed: (){}, child: Text("Yes"),color: Colors.green,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),),
    ],
    elevation: 24.0,
    backgroundColor: Colors.blue,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),

  );
}

class _MemberTabListItemState extends State<MemberTabListItem> {

  UserType _userType =UserType.Master;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
         /* if(_userType==UserType.Master)
          {
            showModalBottomSheet(context: context,
              builder:(BuildContext context)=> SetMemberPoints());
          }*/

          //  print('Do you want to replace ${widget.playerOutName} with ${widget.memberName}');
            showDialog(context: context,builder: (_)=>transfer_Player(widget.playerOutName, widget.memberName));
        });
      },
      child: Container(
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
                  child: Text(widget.memberName,style: kLabelGroupStyle)),
              Positioned(
                  top: 5,
                  left: 160,
                  child: Text('${widget.price.toString()} \$',style: kLabelGroupStyle)),
              Positioned(
                  top: 5,
                  left: 245,
                  child: Text(widget.lastScore.toString(),style: kLabelGroupStyle)),
              Positioned(
                  top: 5,
                  left: 315,
                  child: Text(widget.overallScore.toString(),style: kLabelGroupStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
