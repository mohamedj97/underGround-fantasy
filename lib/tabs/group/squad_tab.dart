import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:fantasy/models/transfers.dart';
class SquadTab extends StatefulWidget {
  @override
  _SquadTabState createState() => _SquadTabState();
}

class _SquadTabState extends State<SquadTab> {

  Transfers _transfersMode=Transfers.Off;

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
            Column(
              children: <Widget>[
                kPlayerSquadImage,
                Container(decoration: kPlayerNameBoxDecoration,
                    width: 80,
                    height: 30,
                    child: Center(child: Text('Salem',style: kLabelPlayerNameStyle,))),

                Container(color: Color.fromRGBO(0,255,135,1),
                    width: 80,
                    height: 15,
                    child: Center(child: Text('30',style: kLabelPlayerPointsStyle,))),
                _transfersMode==Transfers.On? GestureDetector(onTap: (){
                  print ('make Transfers');
                },
                    child: Icon(Icons.add,color: Colors.black,)):Container(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    kPlayerSquadImage,
                    Container(color: Color.fromRGBO(0,117,58,1),
                        width: 80,
                        height: 30,
                        child: Center(child: Text('Amr',style: kLabelPlayerNameStyle,))),
                    Container(color: Color.fromRGBO(0,255,135,1),
                        width: 80,
                        height: 15,
                        child: Center(child: Text('5',style: kLabelPlayerPointsStyle,))),
                    _transfersMode==Transfers.On?  GestureDetector(onTap: (){
                      print ('make Transfers');
                    },
                        child: Icon(Icons.add,color: Colors.black,)):Container(),
                  ],
                ),
                SizedBox(width: 140,),
                Column(
                  children: <Widget>[
                    kPlayerSquadImage,
                    Container(color: Color.fromRGBO(0,117,58,1),
                        width: 80,
                        height: 30,
                        child: Center(child: Text('Marwan',style: kLabelPlayerNameStyle,))),
                    Container(color: Color.fromRGBO(0,255,135,1),
                        width: 80,
                        height: 15,
                        child: Center(child: Text('90',style: kLabelPlayerPointsStyle,))),
                    Icon(Icons.copyright,color: Colors.black,),
                    _transfersMode==Transfers.On? GestureDetector(onTap: (){
                      print ('make Transfers');
                    },
                        child: Icon(Icons.add,color: Colors.black,)):Container(),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    kPlayerSquadImage,
                    Container(color: Color.fromRGBO(0,117,58,1),
                        width: 80,
                        height: 30,
                        child: Center(child: Text('Jimmy',style: kLabelPlayerNameStyle,))),
                    Container(color: Color.fromRGBO(0,255,135,1),
                        width: 80,
                        height: 15,
                        child: Center(child: Text('15',style: kLabelPlayerPointsStyle,))),
                    _transfersMode==Transfers.On?GestureDetector(onTap: (){
                      print ('make Transfers');
                    },
                        child: Icon(Icons.add,color: Colors.black,)):Container(),
                  ],
                ),
                SizedBox(width: 140,),
                Column(
                  children: <Widget>[
                    kPlayerSquadImage,
                    Container(color: Color.fromRGBO(0,117,58,1),
                        width: 80,
                        height: 30,
                        child: Center(child: Text('Gedo',style: kLabelPlayerNameStyle,))),
                    Container(color: Color.fromRGBO(0,255,135,1),
                        width: 80,
                        height: 15,
                        child: Center(child: Text('33',style: kLabelPlayerPointsStyle,))),
                    _transfersMode==Transfers.On?GestureDetector(onTap: (){
                      print ('make Transfers');
                    },
                        child: Icon(Icons.add,color: Colors.black,)):Container(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
