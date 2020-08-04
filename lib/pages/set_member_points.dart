import 'package:fantasy/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/components/round_icon_button.dart';
import 'package:fantasy/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fantasy/components/bottom_button.dart';

class SetMemberPoints extends StatefulWidget {
  static const String id = 'SetMemberPoints';
  @override
  _SetMemberPointsState createState() => _SetMemberPointsState();
}
/// Goals scored ---assists---Saves---clean sheet----Goals Conceded----penalty scored----penalty saved----bonus


class _SetMemberPointsState extends State<SetMemberPoints> {
  int goalsScored=0;
  int assists=0;
  int saves=0;
  String cleanSheet='No';
  int goalConceded=0;
  int penaltySaved=0;
  int penaltyScored=0;
  int bonus=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('PlayerPoints'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Goals Scored',style: kLabelPlayerNameStyle,),
                        Text(goalsScored.toString(),style: kLabelPlayerNameStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                            {
                              setState(() {
                                if(goalsScored>0)
                                {goalsScored--;}
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                            {
                              setState(() {
                                goalsScored++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Assists',style: kLabelPlayerNameStyle,),
                        Text(assists.toString(),style: kLabelPlayerNameStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                            {
                              setState(() {
                                if(assists>0)
                                {assists--;}
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                            {
                              setState(() {
                                assists++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Saves',style: kLabelPlayerNameStyle,),
                        Text(saves.toString(),style: kLabelPlayerNameStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                            {
                              setState(() {
                                if(saves>0)
                                {saves--;}
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                            {
                              setState(() {
                                saves++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Clean Sheet',style: kLabelPlayerNameStyle,),
                        Text(cleanSheet,style: cleanSheet=='Yes'?TextStyle(fontSize: 20,color: Colors.green)
                            :TextStyle(fontSize:20,color: Colors.red)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: Icons.close,onPressed: ()
                            {
                              setState(() {
                                cleanSheet='No';
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: Icons.done,onPressed: ()
                            {
                              setState(() {
                                cleanSheet='Yes';
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Goals Conceded',style: kLabelPlayerNameStyle,),
                        Text(goalConceded.toString(),style: kLabelPlayerNameStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                            {
                              setState(() {
                                if(goalConceded>0)
                                  {goalConceded--;}
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                            {
                              setState(() {
                                goalConceded++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Penalty Scored',style: kLabelPlayerNameStyle,),
                        Text(penaltyScored.toString(),style: kLabelPlayerNameStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                            {
                              setState(() {
                                if(penaltyScored>0)
                                {penaltyScored--;}
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                            {
                              setState(() {
                                penaltyScored++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Penalty Saved',style: kLabelPlayerNameStyle,),
                        Text(penaltySaved.toString(),style: kLabelPlayerNameStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                            {
                              setState(() {
                                if(penaltySaved>0)
                                  {
                                    penaltySaved--;
                                  }
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                            {
                              setState(() {
                                penaltySaved++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
                Expanded(
                  child: ReusableCard(colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Bonus',style: kLabelPlayerNameStyle,),
                        Text(bonus.toString(),style: kLabelPlayerNameStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                            {
                              setState(() {
                                if(bonus>0)
                                  {bonus--;}
                              });
                            },),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                            {
                              setState(() {
                                bonus++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),),
                ),
              ],
            ),
            BottomButton(buttonTitle:'Submit',onTap: (){

            },)
          ],
        ),
      ),
    );
  }
}
