import 'package:fantasy/utilities/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTitle;

  BottomButton({this.onTap, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kInActiveCardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: Text(buttonTitle,style: kLargeButtonStyle,)),
        height: 80,
      ),
    );
  }
}