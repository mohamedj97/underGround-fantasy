import 'package:fantasy/models/player_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/models/transfers.dart';
import 'package:fantasy/widgets/player_in_squad.dart';

class SquadTab extends StatefulWidget {
  @override
  _SquadTabState createState() => _SquadTabState();
}

class _SquadTabState extends State<SquadTab> {
  Transfers _transfersMode = Transfers.Off;
  List<Map<String, dynamic>> squadPlayers = [
    {'name': 'Salem', 'score': 30,'playerMode':PlayerMode.NotCaptain},
    {'name': 'Amr', 'score': 5,'playerMode':PlayerMode.NotCaptain},
    {'name': 'Marwan', 'score': 50,'playerMode':PlayerMode.NotCaptain},
    {'name': 'Jimmy', 'score': 15,'playerMode':PlayerMode.NotCaptain},
    {'name': 'Gedo', 'score': 33,'playerMode':PlayerMode.NotCaptain}
  ];
    AlertDialog playersCaptain(String playerName,int playerNumber)
    {
     return AlertDialog(
        title: Center(child: Text('$playerName',style: TextStyle(color:Colors.white),)),
        actions: <Widget>[
          FlatButton(onPressed: (){
            setState(() {
              for(int i=0;i<squadPlayers.length;i++)
              {
                if(i==playerNumber)
                {
                  squadPlayers[playerNumber]['playerMode']=PlayerMode.Captain;
                }
                else{squadPlayers[i]['playerMode']=PlayerMode.NotCaptain;}
              }
            });
          }, child: Text("Make Captain ?"),
            color:Color.fromRGBO(0,255,135,1),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),),
          FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Make Vice Captain ?"),
            color:Color.fromRGBO(0,117,58,1),shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),),
        ],
        elevation: 24.0,
        backgroundColor: Colors.black54,
      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '65',
          style: TextStyle(fontSize: 40, color: Color.fromRGBO(0, 255, 135, 1)),
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                setState(() {
                  _transfersMode = _transfersMode == Transfers.Off
                      ? Transfers.On
                      : Transfers.Off;
                  print('Transfeeeeers$_transfersMode');
                });
              },
              child: Image.asset('assets/substitution.png')),

        ],

      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/cavk.png'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                showDialog(context: context,builder: (_)=> playersCaptain(squadPlayers[0]['name'],0));
              },
              child: PlayerInSquad(
                playerMode: squadPlayers[0]['playerMode'],
                playerName: squadPlayers[0]['name'],
                playerScore: squadPlayers[0]['score'],
                transfersMode: _transfersMode,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    showDialog(context: context,builder: (_)=> playersCaptain(squadPlayers[1]['name'],1));
                  },
                  child: PlayerInSquad(
                    playerMode: squadPlayers[1]['playerMode'],
                    playerName: squadPlayers[1]['name'],
                    playerScore: squadPlayers[1]['score'],
                    transfersMode: _transfersMode,
                  ),
                ),
                SizedBox(
                  width: 140,
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(context: context,builder: (_)=> playersCaptain(squadPlayers[2]['name'],2));
                  },
                  child: PlayerInSquad(
                    playerMode: squadPlayers[2]['playerMode'],
                    playerName: squadPlayers[2]['name'],
                    playerScore: squadPlayers[2]['score'],
                    transfersMode: _transfersMode,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    showDialog(context: context,builder: (_)=> playersCaptain(squadPlayers[3]['name'],3));
                  },
                  child: PlayerInSquad(
                    playerMode: squadPlayers[3]['playerMode'],
                    playerName: squadPlayers[3]['name'],
                    playerScore: squadPlayers[3]['score'],
                    transfersMode: _transfersMode,
                  ),
                ),
                SizedBox(
                  width: 140,
                ),
                GestureDetector(
                  onTap: (){
                    showDialog(context: context,builder: (_)=> playersCaptain(squadPlayers[4]['name'],4));
                  },
                  child: PlayerInSquad(
                    playerMode: squadPlayers[4]['playerMode'],
                    playerName: squadPlayers[4]['name'],
                    playerScore: squadPlayers[4]['score'],
                    transfersMode: _transfersMode,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
