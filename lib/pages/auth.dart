import 'dart:convert';
import 'package:fantasy/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fantasy/models/auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class AuthPage extends StatefulWidget {
  static const String id = 'AuthPage';

  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {

  final _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();
  bool isSignIn = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;
  bool _rememberMe = false;
  String _email;
  String _password;
  bool _isLoading = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  void _facebookLogin() async {
    FacebookLogin _fbLogin = new FacebookLogin();
    final result = await _fbLogin.logIn(['email']);
    FacebookAccessToken token = result.accessToken;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    final profile = json.decode(graphResponse.body);
    print('sssssssss${graphResponse.body}');
    if (result.status == _fbLogin.isLoggedIn) {
      AuthCredential authCredential = FacebookAuthProvider.getCredential(
          accessToken: token.token);
      _auth.signInWithCredential(authCredential);
    }
    setState(() {
      isSignIn = true;
    });
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  Future<void> _googleLogin() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
        .authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));

    _user = result.user;

    setState(() {
      isSignIn = true;
    });
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  Future<void> googleSignOut() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
  }

  Widget _buildEmailTF() {
    return SafeArea(
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0),
            TextFormField(
              controller: emailController,
              validator: (String value) {
                if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'E-mail',
                hintStyle: kHintTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameTF() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          TextFormField(
            controller: nameController,
            validator: (String value) {
              if (value
                  .trim()
                  .isEmpty) {
                return 'Name Nedded';
              }
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: 'NAME',
              hintStyle: kHintTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: kBoxDecorationStyle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0),
          TextFormField(
            controller: passwordController,
            validator: (String value) {
              if (value
                  .trim()
                  .isEmpty) {
                return 'Password needed';
              }
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.grey[700],
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildAuthBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save;
            try {
              if (_authMode == AuthMode.SignUp) {
                setState(() {
                  _isLoading = true;
                });
                await signUP(emailController.text, nameController.text,
                    passwordController.text);
              } else if (_authMode == AuthMode.Login) {
                setState(() {
                  _isLoading = true;
                });
                await signIn(emailController.text, passwordController.text);
              }
            } catch (e) {
              print(e);
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          _authMode == AuthMode.SignUp ? 'Register' : 'LOGIN',
          style: TextStyle(
            color: Colors.blueAccent,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn({AssetImage logo, Function tap}) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(logo: AssetImage('assets/logos/facebook.jpg'),
              tap: _facebookLogin),
          _buildSocialBtn(
              logo: AssetImage('assets/logos/google.jpg'), tap: _googleLogin),
        ],
      ),
    );
  }

  Widget _buildChangeModeBtn() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _authMode =
          _authMode == AuthMode.Login ? AuthMode.SignUp : AuthMode.Login;
        });
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text:
              ('${_authMode == AuthMode.Login
                  ? 'Don\'t have an Account? '
                  : 'have an Account? '}'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ('${_authMode == AuthMode.Login ? 'Signup' : 'Login'}'),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map <String, String> authData = {
      'email': email,
      'password': pass
    };
    final Map<String, String> headers = {
      "Content-Type": 'application/json',
    };
    Map<String, dynamic> responseData;

    final http.Response response = await http.post(
        '$BASE_URL''user/signin', body: jsonEncode(authData),
        headers: headers);
    responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseData != null) {
        await sharedPreferences.setString("token", responseData['authToken']);
        setState(() {
          _isLoading = false;
        });
        print('${responseData['user']['email']}');
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) => HomePage()), (
            Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print('${responseData['message']}');
      Toast.show(
          '${responseData['message']}', context, duration: Toast.LENGTH_LONG);
    }
  }

  signUP(String email, name, pass) async
  {
    Map <String, String> authData = {
      'email': email,
      'name': name,
      'password': pass
    };
    final Map<String, String> headers = {
      "Content-Type": 'application/json',
    };
    final http.Response response = await http.post(
        '$BASE_URL''user', body: jsonEncode(authData), headers: headers);
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseData != null) {
        //await sharedPreferences.setString("token", responseData['authToken']);
        setState(() {
          _isLoading = false;
        });
        print('${responseData['message']}');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()), (
            Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print('${responseData['message']}');
      Toast.show(
          '${responseData['message']}', context, duration: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: kBackGroundContainerDecoration,
              ),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.asset('assets/bg.png'),
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _authMode == AuthMode.SignUp
                          ? _buildNameTF()
                          : Container(),
                      _authMode == AuthMode.SignUp
                          ? SizedBox(height: 20.0,)
                          : Container(),
                      _buildPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _authMode == AuthMode.SignUp
                          ? Container()
                          : _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildAuthBtn(),
                      _authMode == AuthMode.SignUp
                          ? Container()
                          : _buildSignInWithText(),
                      _authMode == AuthMode.SignUp
                          ? Container()
                          : _buildSocialBtnRow(),
                      _buildChangeModeBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
