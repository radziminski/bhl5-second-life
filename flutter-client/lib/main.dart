import 'package:SecondLife/constants.dart';
import 'package:SecondLife/locator.dart';
import 'package:SecondLife/routes.dart';
import 'package:SecondLife/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(SecondLifeApp());
}

class SecondLifeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kTitle,
      theme: appTheme,
      initialRoute: kLoginRoute,
      routes: appRoutes,
    );
  }
}
