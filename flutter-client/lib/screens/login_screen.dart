import 'package:SecondLife/constants.dart';
import 'package:SecondLife/locator.dart';
import 'package:SecondLife/state/auth_model.dart';
import 'package:SecondLife/widgets/BigButton.dart';
import 'package:SecondLife/widgets/TextInput.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthModel authModel = locator<AuthModel>();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text(
                      'Welcome to Second Life!',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Type in your username to proceed.',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextInput(usernameController, 'Enter your Username'),
              ),
              BigButton(
                'Sign in',
                () {
                  authModel.login(usernameController.text);
                  Navigator.pushNamed(context, kHomeRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
