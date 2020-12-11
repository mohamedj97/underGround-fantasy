import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:fantasy/tabs/group/members_tab.dart';
import 'package:fantasy/models/transfers.dart';
import 'package:fantasy/models/player_mode.dart';


AlertDialog addPlayer(){
  return AlertDialog(
    title:Text("Transfer"),
    content: Text("Do you Want to add this Player to your Team ??"),
    actions: <Widget>[
      FlatButton(onPressed: null, child: Text("No")),
      FlatButton(onPressed: null, child: Text("Yes")),
    ],
    elevation: 24.0,
    backgroundColor: Colors.white,
  );
}

class PlayerInSquad extends StatefulWidget {
  final String playerName;
  final int playerScore;
  final Transfers transfersMode;
  final PlayerMode playerMode;

  PlayerInSquad({this.playerName, this.playerScore, this.transfersMode,this.playerMode});

  @override
  _PlayerInSquadState createState() => _PlayerInSquadState();
}

class _PlayerInSquadState extends State<PlayerInSquad> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        widget.playerMode==PlayerMode.Captain?Image(image: new AssetImage("assets/captain.jpg"),
          height: 30,
          width: 50,
          color: null,
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
        ):Container(),
        kPlayerSquadImage,
        Container(color: Color.fromRGBO(0,117,58,1),
            width: 80,
            height: 30,
            child: Center(child: Text(widget.playerName,style: kLabelPlayerNameStyle,))),
        Container(color: Color.fromRGBO(0,255,135,1),
            width: 80,
            height: 15,
            child: Center(child: Text('${widget.playerScore}',style: kLabelPlayerPointsStyle,))),
        widget.transfersMode==Transfers.On?GestureDetector(onTap: (){
          print('kokokkokookoko');
          Navigator.push(context,  MaterialPageRoute(builder: (context)=>MembersTab(playerOutName: widget.playerName,transfersMode: Transfers.On,)));
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