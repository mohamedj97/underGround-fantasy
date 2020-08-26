import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/models/transfers.dart';
import 'package:fantasy/widgets/player_in_squad.dart';
class SquadTab extends StatefulWidget {
  @override
  _SquadTabState createState() => _SquadTabState();
}

class _SquadTabState extends State<SquadTab> {

  Transfers _transfersMode=Transfers.Off;
  List<Map<String,dynamic>> squadPlayers=[{'name':'Salem','score':30},
    {'name':'Amr','score':5},{'name':'Marwan','score':50},
    {'name':'Jimmy','score':15},{'name':'Gedo','score':33}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('65',style: TextStyle(fontSize:40,color: Color.fromRGBO(0,255,135,1))
        ,),centerTitle: true,actions: <Widget>[
        GestureDetector(
          onTap: (){
            setState(() {
              _transfersMode =
              _transfersMode == Transfers.Off ? Transfers.On : Transfers.Off;
              print('Transfeeeeers${_transfersMode}');
            });
          },
            child: Image.asset('assets/substitution.png')),
      ],),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/cavk.png'),
          fit: BoxFit.fill)
        ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            PlayerInSquad(playerName:squadPlayers[0]['name'],playerScore: squadPlayers[0]['score'],transfersMode: _transfersMode,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlayerInSquad(playerName:squadPlayers[1]['name'],playerScore: squadPlayers[1]['score'],transfersMode: _transfersMode,),
                SizedBox(width: 140,),
                PlayerInSquad(playerName:squadPlayers[2]['name'],playerScore: squadPlayers[2]['score'],transfersMode: _transfersMode,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlayerInSquad(playerName:squadPlayers[3]['name'],playerScore: squadPlayers[3]['score'],transfersMode: _transfersMode,),
                SizedBox(width: 140,),
                PlayerInSquad(playerName:squadPlayers[4]['name'],playerScore: squadPlayers[4]['score'],transfersMode: _transfersMode,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
