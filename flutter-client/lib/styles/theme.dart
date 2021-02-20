import 'package:flutter/material.dart';

const kColors = {
  'primary': Color(0xFF222831),
  'primaryLight': Color(0xFF31314B),
  'background': Color(0xFF1C1B1B),
  'text': Colors.black,
};

ThemeData appTheme = ThemeData(
  primaryColor: kColors['primary'],
  accentColor: kColors['primaryLight'],
  canvasColor: kColors['background'],
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);
