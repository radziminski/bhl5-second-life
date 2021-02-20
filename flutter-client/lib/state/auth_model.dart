import 'package:flutter/cupertino.dart';

class AuthModel extends ChangeNotifier {
  String username;

  Future logout() {
    username = null;
    notifyListeners();
  }

  Future login(String username) {
    // Perform api request

    this.username = username;
    notifyListeners();
  }
}
