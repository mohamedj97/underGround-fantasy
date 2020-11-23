import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:fantasy/components/round_icon_button.dart';
import 'package:toast/toast.dart';

class MatchNotification extends StatefulWidget {

  const MatchNotification({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;

  @override
  _MatchNotificationState createState() => _MatchNotificationState();
}

class _MatchNotificationState extends State<MatchNotification> {
  DateTime _dateTime;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int startTime=1;
  int endTime=1;
  bool timeType=false;
  final TextEditingController placeController = new TextEditingController();


  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Match'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.blueGrey,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,left: 8,right:8,bottom: 20),
                    child: Text('Play another Match ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: placeController,
                              validator: (String value) {
                                if(value.trim().isEmpty) {
                                  return 'Place Needed';
                                }
                              },
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 25
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey,
                                prefixIcon: Icon(
                                  Icons.place,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                hintText: 'Write Match Place',
                                hintStyle: kHintTextStyle,
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),//Place
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 10,
                            top: 15,
                            child: Text('Date',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                        Positioned(
                          left: 100,
                          child: IconButton(icon: Icon(Icons.date_range),iconSize: 50,onPressed: (){
                            showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2022))
                                .then((date){
                              setState(() {
                                _dateTime=date;
                                DateFormat dateFormat = DateFormat("dd-MM-yyyy");
                                dateFormat.format(_dateTime);
                              });
                            });
                          },),
                        ),
                        Positioned(
                            left: 180,
                            top: 15,
                            child: Text(_dateTime==null?'':'${_dateTime.toString().substring(0,10)}',style: TextStyle(fontSize: 30),)),
                      ],
                    ),
                  ),//On
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 10,
                            top: 15,
                            child: Text('From',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
                        Positioned(
                          left: 100,
                          child: RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                          {
                            setState(() {
                              if(startTime>1)
                              {startTime--;}
                            });
                          },),
                        ),
                        Positioned(
                            left:startTime>=10?170:180,
                            top: 10,
                            child: Text('$startTime',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
                        Positioned(
                          left: 220,
                          child: RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                          {
                            setState(() {
                              if(startTime>=1&&startTime<12){
                                startTime++;
                              }
                            });
                          },),
                        ),
                      ],
                    ),
                  ),//From
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 10,
                            top: 15,
                            child: Text('To',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
                        Positioned(
                          left: 100,
                          child: RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: ()
                          {
                            setState(() {
                              if(endTime>1)
                              {endTime--;}
                            });
                          },),
                        ),
                        Positioned(
                            left: endTime>=10?170:180,
                            top: 10,
                            child: Text('$endTime',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
                        Positioned(
                          left: 220,
                          child: RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: ()
                          {
                            setState(() {
                              if(endTime>=1&&endTime<12){
                                endTime++;
                              }
                            });
                          },),
                        ),
                      ],
                    ),
                  ),//To
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left:10,
                            top: 15,
                            child: Text(timeType==false?'PM':'AM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
                        Positioned(
                          left: 100,
                          child: RoundIconButton(icon: FontAwesomeIcons.solidSun,onPressed: ()
                          {
                            setState(() {
                              timeType=true;
                            });
                          },),
                        ),
                        Positioned(
                          left: 220,
                          child: RoundIconButton(icon: FontAwesomeIcons.solidMoon,onPressed: ()
                          {
                            setState(() {
                              timeType=false;
                            });
                          },),
                        ),
                      ],
                    ),
                  ),//AM
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 100,
                          child: MaterialButton(onPressed:(){
                            if(_formKey.currentState.validate()&&_dateTime!=null)
                              {
                                _formKey.currentState.save;
                                try {

                                } catch (e) {

                                  print(e);
                                }
                              }
                            else if(_dateTime==null){
                              showToast('Please choose Match Date', duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                            }
                          },
                            color: Colors.green,
                            minWidth: 200,
                            child: Icon(Icons.send),),
                        ),
                      ],
                    ),
                  )//Send
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
