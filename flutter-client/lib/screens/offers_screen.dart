import 'package:SecondLife/widgets/DefaultBottomNavBar.dart';
import 'package:SecondLife/widgets/OffersSwiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: buildDefaultAppBar(context, 'Second Life'),
      bottomNavigationBar: buildDefaultBottomNavBar(context, 0),
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Icon(
            //         CupertinoIcons.settings,
            //         color: Colors.white,
            //       ),
            //       Icon(
            //         CupertinoIcons.search,
            //         color: Colors.white,
            //       ),
            //       Icon(
            //         CupertinoIcons.chat_bubble,
            //         color: Colors.white,
            //       ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: OffersSwiper(),
            ),
          ],
        ),
      ),
    );
  }
}
