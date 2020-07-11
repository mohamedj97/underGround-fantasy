import 'dart:convert';

import 'package:fantasy/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fantasy/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fantasy/models/auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class AuthPage extends StatefulWidget {
  static const String id = 'AuthPage';

  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {


  void _facebookLogin()async
  {
    FacebookLogin _fbLogin=new FacebookLogin();
    final result = await _fbLogin.logIn(['email']);
    FacebookAccessToken token = result.accessToken;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
     final profile = json.decode(graphResponse.body);
    print('sssssssss${graphResponse.body}');
    if(result.status==_fbLogin.isLoggedIn)
      {
        AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: token.token);
        _auth.signInWithCredential(authCredential);
      }
  }


  final _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;
  bool _rememberMe = false;
  String _email;
  String _password;

  Widget _buildEmailTF() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 50.0,
            child: TextFormField(
              validator: (String value) {
                if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
              },
              onChanged: (String value) {
                _email = value;
              },
              onSaved: (String value) {
                _email = value;
              },
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextFormField(
            validator: (String value) {
              if (value.length < 6) {
                return 'Password must be invalid and +6 characters';
              }
            },
            onChanged: (String value) {
              _password = value;
            },
              onSaved:  (String value) {
              _email = value;
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
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
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: _email, password: _password);
                if (newUser != null) {
                  Navigator.pushReplacementNamed(context, HomePage.id);
                }
              } else if (_authMode == AuthMode.Login) {
                final user = await _auth.signInWithEmailAndPassword(
                    email: _email, password: _password);

                if (user != null) {
                  Navigator.pushReplacementNamed(context, HomePage.id);
                }
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
            color: Colors.grey,
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

  Widget _buildSocialBtn(AssetImage logo) {
    return GestureDetector(
      onTap:()=>_facebookLogin(),
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
          _buildSocialBtn(
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
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
                  ('${_authMode == AuthMode.Login ? 'Don\'t have an Account? ' : 'have an Account? '}'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
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
