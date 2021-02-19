import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  TextInput(this.controller, this.hintText);
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.065),
            borderRadius: BorderRadius.all(Radius.circular(14)),
            border: Border.all(color: Colors.white.withOpacity(0.09), width: 1),
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.3),
              ),
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
