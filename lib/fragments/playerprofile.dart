import 'package:flutter/material.dart';
import 'package:path/path.dart';
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

  Image imagecheck()
  {
    if(_imageUrl!=null){
      return Image.network(_imageUrl);
    }else if(_image!=null){
      return Image.file(_image);
    }else{
      Image.asset('assets/noprofile.jpg');
    }

  }

  void initState() {
    super.initState();

    var ref = FirebaseStorage.instance.ref().child("/ProfileImages/333").child("333");
    _image=null;
    ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));
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
      String fileName = "333";
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child("/ProfileImages/333").child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }


    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("UserName",
                          style: TextStyle(
                              color: Colors.blueAccent,fontSize: 18.0
                          ),),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('GasserAshraf',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Icon(
                    Icons.edit,
                    color: Color(0xff476cfb),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email",
                          style: TextStyle(
                              color: Colors.blueAccent,fontSize: 18.0
                          ),),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('GasserAshraf977@gmail.com',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Icon(
                    Icons.edit,
                    color: Color(0xff476cfb),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password",
                          style: TextStyle(
                              color: Colors.blueAccent,fontSize: 18.0
                          ),),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('*********',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Icon(
                    Icons.edit,
                    color: Color(0xff476cfb),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              height: 30.0
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Color(0xff476cfb),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              RaisedButton(
                color: Color(0xff476cfb),
                onPressed: () {
                  print("upload");
                  uploadPic(context);
                },

                elevation: 4.0,
                splashColor: Colors.blueGrey,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

}
