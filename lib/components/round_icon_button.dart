import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onPressed;

  RoundIconButton({@required this.icon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed:onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}