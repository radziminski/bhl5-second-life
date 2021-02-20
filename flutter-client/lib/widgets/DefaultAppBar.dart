import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildDefaultAppBar(context, String title) {
  print(Theme.of(context).primaryColor);
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.poppins(fontWeight: FontWeight.w400),
    ),
    elevation: 0,
    backgroundColor: Theme.of(context).canvasColor,
  );
}
