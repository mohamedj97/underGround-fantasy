import 'package:flutter/material.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Group Name',
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
                  onTap: (startLoading, stopLoading, btnState) {
                    if(btnState != ButtonState.Idle)
                      {
                        stopLoading();
                      }
                    if(btnState == ButtonState.Idle){
                      startLoading();
                      //awit Ay7AGA
                      // stopLoading();
                    }
                  }
              ),
            ],),
          Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter Group Code',
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
                  onTap: (startLoading, stopLoading, btnState) {
                    if(btnState != ButtonState.Idle)
                    {
                      stopLoading();
                    }
                    if(btnState == ButtonState.Idle){
                      startLoading();
                      //awit Ay7AGA
                      // stopLoading();
                    }
                  }
              ),
            ],),
        ],
      ),
    );
  }
}
