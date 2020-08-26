import 'package:fantasy/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/widgets/member_tab_item.dart';

class MembersTab extends StatefulWidget {

  static const String id = 'MembersTab';

  final String playerOutName;
  final Transfers transfersMode;
  MembersTab({this.playerOutName,this.transfersMode});

  @override
  _MembersTabState createState() => _MembersTabState();
}

class _MembersTabState extends State<MembersTab> {

  List<Map<String,dynamic>> _groupMembers=[{'name':'Jimmy','lastScore':20,'overallScore':170,'price':2},
    {'name':'Gasser','lastScore':20,'overallScore':170,'price':6},{'name':'Ashraf','lastScore':20,'overallScore':170,'price':4},
    {'name':'Roshdy','lastScore':20,'overallScore':170,'price':8},{'name':'Salem','lastScore':20,'overallScore':170,'price':6},
    {'name':'Amr','lastScore':20,'overallScore':170,'price':7},{'name':'Samir','lastScore':20,'overallScore':170,'price':4}];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        body: Column(
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
                            Text('Name',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                            SizedBox(width: 85,),
                            Text('Price',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Text('Last',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                            SizedBox(
                              width: 40,
                            ),
                            Text('Total',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(itemCount:_groupMembers.length,
                    itemBuilder: (context,index){
                  return MemberTabListItem(memberName: _groupMembers[index]['name'],
                    lastScore: _groupMembers[index]['lastScore'],overallScore: _groupMembers[index]['overallScore']
                    ,price: _groupMembers[index]['price'],playerOutName: widget.playerOutName,);
                }),
              ),
            ],
          ),
        ),
    );
  }
}
