import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

Container textFieldContainer(TextEditingController _Controller,
    String labelText, String hintText, Icon buttonIcon) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    child: TextField(
      controller: _Controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 3),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        prefixIcon: buttonIcon,
        labelText: labelText,
        hintText: hintText,
      ),
    ),
  );
}

class _ProfileState extends State<Profile> {
  File _image;
  String _imageUrl;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _teamNameController = TextEditingController();
  final _passwordController = TextEditingController();

  void getCurrentUser() async
  {
    final user = await _auth.currentUser();
    var ref = FirebaseStorage.instance.ref().child("/ProfileImages").child(
        user.uid);
    _image = null;
    try {
      ref.getDownloadURL().then((loc) => setState(() => _imageUrl = loc));
    }
    catch (e){
      _imageUrl=null;
    }
  }

  ImageProvider imagecheck() {
    if (_imageUrl != null) {
      return NetworkImage(_imageUrl);
    } else if (_image != null) {
      return FileImage(_image);
    } else{
     return AssetImage('assets/noprofile.jpg');
    }
  }

  @override
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _imageUrl = null;
    setState(() {
      _image = image;
    });
  }
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future uploadPic(BuildContext context) async {
    final user = await _auth.currentUser();
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(
        "/ProfileImages").child(user.uid);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("Profile Picture uploaded");
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 40.0),
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0,
                            color: Theme
                                .of(context)
                                .scaffoldBackgroundColor),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imagecheck()),
                      ),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.deepOrange,
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Center(child: new Icon(Icons.add_a_photo)),
                              color: Colors.deepOrange,
                              onPressed: () {
                                getImage();
                              },
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              textFieldContainer(_emailController, "e-mail", "example@abc.com",
                  Icon(Icons.email)),

              textFieldContainer(
                  _userNameController, "UserName", "example",
                  Icon(Icons.person)),

              textFieldContainer(
                  _teamNameController, "team-Name", "example@abc.com",
                  Icon(Icons.edit)),

              textFieldContainer(
                  _passwordController, "Password", "**********",
                  Icon(Icons.lock)),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      uploadPic(context);
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
