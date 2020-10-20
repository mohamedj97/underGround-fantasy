import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:fantasy/tabs/group/members_tab.dart';
import 'package:fantasy/models/transfers.dart';

class PlayerInSquad extends StatelessWidget {
  final String playerName;
  final int playerScore;
  final Transfers transfersMode;

  PlayerInSquad({this.playerName, this.playerScore, this.transfersMode});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        kPlayerSquadImage,
        Container(color: Color.fromRGBO(0,117,58,1),
            width: 80,
            height: 30,
            child: Center(child: Text(playerName,style: kLabelPlayerNameStyle,))),
        Container(color: Color.fromRGBO(0,255,135,1),
            width: 80,
            height: 15,
            child: Center(child: Text('$playerScore',style: kLabelPlayerPointsStyle,))),
        transfersMode==Transfers.On?GestureDetector(onTap: (){
          print('kokokkokookoko');
          Navigator.push(context,  MaterialPageRoute(builder: (context)=>MembersTab(playerOutName: playerName,transfersMode: transfersMode,)));
        },
            child: Image(image: new AssetImage("assets/AddPlayer.png"),
              height: 30,
              width: 50,
              color: null,
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
            )):Container(),
      ],
    );
  }
}