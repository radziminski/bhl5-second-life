import 'dart:async';

import 'package:SecondLife/locator.dart';
import 'package:SecondLife/state/auth_model.dart';
import 'package:SecondLife/state/chat_model.dart';
import 'package:SecondLife/widgets/Chat.dart';
import 'package:SecondLife/widgets/DefaultAppBar.dart';
import 'package:SecondLife/widgets/DefaultBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatModel chatModel = locator<ChatModel>();
  final AuthModel authModel = locator<AuthModel>();
  bool isLoaded = false;
  TextEditingController messageController = TextEditingController();
  int offerId = 4;
  String sender = 'Odey';
  String receiver = 'Peterus';

  Timer requestRenew;

  @override
  void initState() {
    super.initState();
    chatModel
        .getCurrMessages(4, 'Odey', 'Peterus')
        .then((_) => setState(() => isLoaded = true));

    requestRenew = Timer.periodic(new Duration(seconds: 15), (timer) async {
      if (!mounted) return;
      try {
        await chatModel.getCurrMessages(4, 'Odey', 'Peterus');
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void dispose() {
    requestRenew.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDefaultAppBar(context, 'Matched trades'),
      bottomNavigationBar: buildDefaultBottomNavBar(context, 2),
      body: SafeArea(
        child: ChangeNotifierProvider.value(
          value: chatModel,
          builder: (context, child) => Column(
            children: [
              Expanded(
                child: Chat(
                  Provider.of<ChatModel>(context).messages,
                  authModel.username,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: TextField(
                            controller: messageController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                              ),
                              hintText: 'Enter a message',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                        child: IconButton(
                          icon: Icon(
                            CupertinoIcons.arrow_right_circle_fill,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: () async {
                            await chatModel.createMessage(offerId, sender,
                                receiver, messageController.text);
                            messageController.clear();
                            FocusScope.of(context).unfocus();
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
