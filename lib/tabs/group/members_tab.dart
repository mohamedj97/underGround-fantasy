import 'package:flutter/material.dart';
import 'package:fantasy/widgets/member_tab_item.dart';

class MembersTab extends StatefulWidget {
  @override
  _MembersTabState createState() => _MembersTabState();
}

class _MembersTabState extends State<MembersTab> {
  List<Map<String,dynamic>> groupMembers=[{'name':'Jimmy','lastScore':20,'overallScore':170},
    {'name':'Gasser','lastScore':20,'overallScore':170},{'name':'Ashraf','lastScore':20,'overallScore':170},
    {'name':'Roshdy','lastScore':20,'overallScore':170},{'name':'Salem','lastScore':20,'overallScore':170},
    {'name':'Amr','lastScore':20,'overallScore':170},{'name':'Samir','lastScore':20,'overallScore':170}];
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
                          SizedBox(width: 100,),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          Text('Last',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                          SizedBox(
                            width: 70,
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
              child: ListView.builder(itemCount:groupMembers.length,
                  itemBuilder: (context,index){
                return MemberTabListItem(memberName: groupMembers[index]['name'],
                  lastScore: groupMembers[index]['lastScore'],overallScore: groupMembers[index]['overallScore'],);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
