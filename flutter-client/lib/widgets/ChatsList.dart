import 'package:SecondLife/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatsList extends StatefulWidget {
  @override
  _ChatsListState createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView(
        children: [1, 2, 3, 4]
            .map(
              (_) => _buildListElement(
                context,
                title: 'Sample Offer',
                subtitle: 'Sample Offer Description',
                trailing: '16:00',
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildListElement(context,
      {String title, String subtitle, String trailing}) {
    return ListTile(
      title: Text(title, style: GoogleFonts.poppins(color: Colors.white)),
      subtitle: Text(subtitle,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
          )),
      trailing: Text(trailing),
      onTap: () {
        Navigator.pushNamed(context, kChatRoute);
      },
      leading: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0),
        ),
        height: 50.0,
        width: 50.0,
      ),
    );
  }
}
