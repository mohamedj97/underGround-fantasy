import 'package:flutter/material.dart';

class RankTab extends StatefulWidget {
  @override
  _RankTabState createState() => _RankTabState();
}

class _RankTabState extends State<RankTab> {

  List<String> teamNames=['Jimmy','Gasser Squad','Ashroof','Roosh'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(64, 75, 96, .9),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 70,
            child: Card(
              color: Colors.white70,
              child: Container(
                padding: EdgeInsets.all(5),
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
//          ListView.builder(itemCount: teamNames.length,
//              itemBuilder: (context,index){
//            return ListItem(teamNames[index]);})
        ],
      ),
    );
  }
}
class ListItem extends StatelessWidget {
  final String title;
  ListItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        ListTile(leading: Text('1'),title: Text(title),trailing: Text('50'),)
      ],
    ),
    );
  }
}
