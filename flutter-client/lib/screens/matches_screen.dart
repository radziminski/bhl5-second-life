import 'package:SecondLife/widgets/ChatsList.dart';
import 'package:SecondLife/widgets/DefaultAppBar.dart';
import 'package:SecondLife/widgets/DefaultBottomNavBar.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDefaultAppBar(context, 'Matched trades'),
      bottomNavigationBar: buildDefaultBottomNavBar(context, 2),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ChatsList(),
            ),
          ],
        ),
      ),
    );
  }
}
