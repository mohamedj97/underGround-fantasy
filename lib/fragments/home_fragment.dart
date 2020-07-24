import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomeFragment extends StatefulWidget {

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser() async
  {
    try{
      final user=await _auth.currentUser();
      if(user!=null)
      {
        loggedInUser=user;
        print('ddddddd${user.uid}');
      }
    }
    catch(e)
    {
      print (e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
