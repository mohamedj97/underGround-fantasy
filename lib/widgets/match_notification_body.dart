import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fantasy/utilities/constants.dart';

class MatchNotification extends StatefulWidget {

  const MatchNotification({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;

  @override
  _MatchNotificationState createState() => _MatchNotificationState();
}

class _MatchNotificationState extends State<MatchNotification> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Match'),
      ),
      body: Container(
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
              Row(
                children: <Widget>[
                  Text('Place'),
//                  TextFormField(
//                    keyboardType: TextInputType.emailAddress,
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontFamily: 'OpenSans',
//                    ),
//                    decoration: InputDecoration(
//                      border: InputBorder.none,
//                      prefixIcon: Icon(
//                        Icons.email,
//                        color: Colors.white,
//                      ),
//                      hintText: 'E-mail',
//                      hintStyle: kHintTextStyle,
//                    ),
//                  )
                ],
              ),
            Row(
              children: <Widget>[
                Text('On',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                IconButton(icon: Icon(Icons.date_range),iconSize: 50,onPressed: (){
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2022))
                  .then((date){
                   setState(() {
                     _dateTime=date;
                   });
                  });
                },),
                Text(_dateTime==null?'':_dateTime.toString()),
              ],
            ),
            Row(
              children: <Widget>[
                Text('From',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('To',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
              MaterialButton(onPressed:(){},
              color: Colors.green,
              child: Icon(Icons.send),)
            ],
          ),
        ),
      ),
    );
  }
}
