import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white70,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);


final kBackGroundContainerDecoration=BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.grey[300],
      Colors.grey[600],
      Colors.grey[800],
      Colors.grey[900],
    ],
    stops: [0.1, 0.4, 0.7, 0.9],
  ),
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.grey[600],
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kLabelGroupStyle=TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  color: Colors.black,
);