import 'package:flutter/material.dart';
import 'package:fantasy/widgets/rank_tab_item.dart';
class RankTab extends StatefulWidget {
  @override
  _RankTabState createState() => _RankTabState();
}

class _RankTabState extends State<RankTab> {

  List<Map<String,dynamic>> teamNames=[{'position':1,'name':'Jimmy','lastPoints':20,'totalPoints':170},
    {'position':2,'name':'Gasser','lastPoints':20,'totalPoints':170},{'position':3,'name':'Ashraf','lastPoints':20,'totalPoints':170},
    {'position':4,'name':'Roshdy','lastPoints':20,'totalPoints':170},{'position':5,'name':'Salem','lastPoints':20,'totalPoints':170},
    {'position':6,'name':'Amr','lastPoints':20,'totalPoints':170},{'position':7,'name':'Samir','lastPoints':20,'totalPoints':170}];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(64, 75, 96, .9),
      child: Column(
        children: <Widget>[
          Container(
            padding:EdgeInsets.all(8),
            height: 60,
            child: Card(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Pos',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        SizedBox(width: 100,),
                        Text('Team',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        Text('Last',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        SizedBox(
                          width: 40,
                        ),
                        Text('Total',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    ],
                ),
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
    );
  }
}

