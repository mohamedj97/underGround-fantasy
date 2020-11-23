import 'package:flutter/material.dart';
import 'package:fantasy/widgets/rank_tab_item.dart';
class RankTab extends StatefulWidget {
  @override
  _RankTabState createState() => _RankTabState();
}

class _RankTabState extends State<RankTab> {

  List<Map<String,dynamic>> teamNames=[{'position':1,'name':'Valhalla','lastPoints':20,'totalPoints':170},
    {'position':2,'name':'ElMafsha5a','lastPoints':20,'totalPoints':170},{'position':3,'name':'Gedo Squad','lastPoints':20,'totalPoints':170},
    {'position':4,'name':'Oreo','lastPoints':20,'totalPoints':170},{'position':5,'name':'ElPuta','lastPoints':20,'totalPoints':170},
    {'position':6,'name':'Nox','lastPoints':20,'totalPoints':170},{'position':7,'name':'Samiiiir','lastPoints':20,'totalPoints':170}];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:EdgeInsets.all(8),
              height: 60,
              child: Card(
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 5,
                        left: 5,
                        child: Text('Pos',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                    Positioned(
                        top: 5,
                        left: 90,
                        child: Text('Team',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                    Positioned(
                        top: 5,
                        left: 240,
                        child: Text('Last',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                    Positioned(
                        top: 5,
                        left: 310,
                        child: Text('Total',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                    ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(itemCount: teamNames.length,
                  itemBuilder: (context,index){
                return RankTabItem(position: teamNames[index]['position'],teamName: teamNames[index]['name'],
                  lastPoints: teamNames[index]['lastPoints'],totalPoints: teamNames[index]['totalPoints'],);}),
            )
          ],
        ),
      ),
    );
  }
}

