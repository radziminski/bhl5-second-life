import 'package:SecondLife/constants.dart';
import 'package:SecondLife/locator.dart';
import 'package:SecondLife/state/auth_model.dart';
import 'package:SecondLife/state/chat_model.dart';
import 'package:SecondLife/state/offers_model.dart';
import 'package:SecondLife/widgets/DefaultAppBar.dart';
import 'package:SecondLife/widgets/DefaultBottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDefaultAppBar(context, 'Settings'),
      bottomNavigationBar: buildDefaultBottomNavBar(context, 3),
      body: SafeArea(
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthModel>.value(
                value: locator<AuthModel>(),
              ),
            ],
            builder: (context, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.person_circle_fill,
                            size: 120,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Jakub Szumski',
                            style: GoogleFonts.poppins(
                              fontSize: 26.0,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ListTile(
                            leading: Icon(
                              CupertinoIcons.escape,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Logout',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            onTap: () {
                              Provider.of<AuthModel>(
                                context,
                                listen: false,
                              ).logout();
                              locator<OffersModel>().clear();
                              locator<ChatModel>().clear();
                              Navigator.pushNamed(context, kLoginRoute);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
