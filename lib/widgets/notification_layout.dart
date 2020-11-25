import 'package:flutter/material.dart';

class NotificationLayout extends StatefulWidget {
  static const String id = 'Notification';

  final int version;

  NotificationLayout(this.version);

  @override
  _NotificationLayoutState createState() => _NotificationLayoutState();
}

class _NotificationLayoutState extends State<NotificationLayout> {
  final List<String> _contents = [

    'Ranks had been updated \n '
        'Good Luck!',

    'Points of Members had been set \n '
        'Hope you did well!',

    'MemberName has been joined The Group as TeamName \n '
        'Have a nice competition!',

  ];

  final List<String> _titles = [

    'Rank Updated',
    'Points set',
    'New Comer',

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          elevation: 3,
          child:Stack(
            children: <Widget>[
              Positioned(
                left: 130,
                  child: Text(_titles[widget.version],style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
              ),//title
              Positioned(
                top: 35,
                left: 10,
                child: Container(
                  decoration:BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)),
                  ),
                    child: Text('Blah Blah Group',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
              ),//groupName
              Positioned(
                left: 10,
                top: 80,
                child: Text(_contents[widget.version],style: TextStyle(color: Colors.black,fontSize: 20),),
              ),//Content
            ],
          ),
        ),
      )
    ;
  }
}
