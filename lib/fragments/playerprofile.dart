import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
class PlayerProfile extends StatefulWidget{
  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {

  File _image;
  String _imageUrl;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final _emailController =TextEditingController();
  final _userNameController =TextEditingController();
  final _teamNameController =TextEditingController();



  void getCurrentUser() async
  {
      final user=await _auth.currentUser();
      var ref = FirebaseStorage.instance.ref().child("/ProfileImages").child(user.uid);
      _image=null;
      ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));



  }
  Image imagecheck()
  {
    if(_imageUrl!=null){
      print('i1');
      return Image.network(_imageUrl);
    }else if(_image!=null){
      print('i2');
      return Image.file(_image);
    }else{
      print('i3');
      Image.asset('assets/noimage.png');
    }

  }

  void initState() {
    super.initState();
    getCurrentUser();
  }
  @override


  Widget build(BuildContext context) {
    // TODO: implement build
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      _imageUrl=null;

      setState(() {

        _image = image;

      });
    }

    Future uploadPic(BuildContext context) async{
      final user=await _auth.currentUser();
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child("/ProfileImages").child(user.uid);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Color(0xff476cfb),
                    child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,

                          child: imagecheck(),
                        )
                    ),
                  ),
                ),
                Padding(

                    padding:EdgeInsets.only(top: 60.0),
                    child: IconButton(icon:Icon(Icons.add_a_photo,size: 30.0),
                      onPressed:()
                      {
                        getImage();
                      },

                    )

                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                width: 360,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(Icons.mail),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.grey
                  ),
                )
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                width: 360,
                child: TextField(
                  controller: _userNameController,

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Username",
                      filled: true,
                      fillColor: Colors.grey
                  ),
                )
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                width: 360,
                child: TextField(
                  controller: _teamNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(Icons.group),
                      hintText: "Teamname",
                      filled: true,
                      fillColor: Colors.grey
                  ),
                )
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              child: Card(
                color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    onTap:(){
                      print(_userNameController.text);
                      uploadPic(context);
                      },
                    leading: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    title: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    onTap:()=> print("hello"),
                    leading: Icon(
                      Icons.check,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontFamily: 'Source Sans Pro',
                        fontSize: 20.0,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

}
