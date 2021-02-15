import 'package:flutter/material.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:toast/toast.dart';

class CreatingOrAddingGroup extends StatefulWidget {
  const CreatingOrAddingGroup({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;

  @override
  _CreatingOrAddingGroupState createState() => _CreatingOrAddingGroupState();
}

class _CreatingOrAddingGroupState extends State<CreatingOrAddingGroup> {

  final TextEditingController joinController = new TextEditingController();
  final TextEditingController createController = new TextEditingController();
  final GlobalKey<FormState> _formKeyJoin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyCreate = GlobalKey<FormState>();
  String token;

  joinGroup(String groupCode)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token=sharedPreferences.getString("token");
    Map <String,String> authData = {
      'code': groupCode,
    };
    final Map<String,String> headers ={
      "Content-Type":'application/json',
      "authToken":token
    };
    Map<String, dynamic> responseData;
    final http.Response response = await http.post(
        '$BASE_URL''group/joinGroup', body: jsonEncode(authData),
        headers: headers);
    responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseData != null) {
        Toast.show('You successfully Joined', context,duration:Toast.LENGTH_LONG);
        print('${responseData['group']['members'][0]}');
//        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
////            builder: (BuildContext context) => Gr()), (
////            Route<dynamic> route) => false);
      }
    }
    else{
      print('${responseData['message']}');
      Toast.show('${responseData['message']}', context,duration:Toast.LENGTH_LONG);
    }
  }

  createGroup(String groupName)async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token=sharedPreferences.getString("token");
    Map <String,dynamic> authData = {
      'name': groupName,
    };
    final Map<String,String> headers ={
      "Content-Type":'application/json',
      "authToken":token
    };
    Map<String, dynamic> responseData;
    final http.Response response = await http.post(
        '$BASE_URL''group/newGroup', body: jsonEncode(authData),
        headers: headers);
    responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseData != null) {
        Toast.show('successfully Created', context,duration:Toast.LENGTH_LONG);
        print('$responseData');
//        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
////            builder: (BuildContext context) => Gr()), (
////            Route<dynamic> route) => false);
      ////////// b7bk ya sabry
      }
    }
    else{
      print('${responseData['message']}');
      Toast.show('${responseData['message']}', context,duration:Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Group'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Form(
              key: _formKeyCreate,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: createController,
                    validator: (String value)
                    {
                      if(value.trim().isEmpty)
                        {
                          return "Enter Group Name";
                        }
                    },
                    decoration: InputDecoration(
                      labelText: 'Group Name',
                      filled: true,
                      fillColor: Colors.red[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ArgonButton(
                      height: 50,
                      width: 250,
                      elevation: 10,
                      highlightElevation: 5,
                      borderRadius: 5.0,
                      color: Colors.grey[900],
                      child: Text(
                        "Create Group",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      loader:Container(
                        padding: EdgeInsets.all(10),
                        child: SpinKitWave(
                          color: Colors.white,
                          size: 30,
                          duration: Duration(milliseconds:700),
                        ),
                      ),
                      onTap: (startLoading, stopLoading, btnState) async{
//                        if(btnState != ButtonState.Idle)
//                        {
//                          stopLoading();
//                        }
                        if(btnState == ButtonState.Idle){
                          startLoading();
                          if (_formKeyCreate.currentState.validate()) {
                            _formKeyCreate.currentState.save;
                            try {
                                await createGroup(createController.text);
                            } catch (e) {
                              print(e);
                            }
                          }
                          //awit Ay7AGA
                           stopLoading();
                        }
                      }
                  ),
                ],),
            ),
            Form(
              key: _formKeyJoin,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: joinController,
                    validator: (String value)
                    {if(value.trim().isEmpty)
                        {
                          return 'valid Code Needed';
                        }
                    },
                    decoration: InputDecoration(
                      labelText: 'Group Code',
                      fillColor: Colors.red[900],
                      filled: true,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  ArgonButton(
                      height: 50,
                      width: 250,
                      borderRadius: 5.0,
                      color: Colors.grey[900],
                      child: Text(
                        "Join Group",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      loader:Container(
                        padding: EdgeInsets.all(10),
                        child: SpinKitWave(
                          color: Colors.white,
                          size: 30,
                          duration: Duration(milliseconds:700),
                        ),
                      ),
                      onTap: (startLoading, stopLoading, btnState) async{
//                        if(btnState != ButtonState.Idle)
//                        {
//                          stopLoading();
//                        }
                        if(btnState == ButtonState.Idle){
                          startLoading();
                          if (_formKeyJoin.currentState.validate()) {
                            _formKeyJoin.currentState.save;
                            try {
                              await joinGroup(joinController.text);
                            } catch (e) {
                              print(e);
                            }
                          }
                          //awit Ay7AGA
                          stopLoading();
                        }
                      }
                  ),//join Group
                ],),
            ),
          ],
        ),
      ),
    );
  }
}