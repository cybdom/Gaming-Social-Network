import 'package:flutter/cupertino.dart';

class MyNavigation extends ChangeNotifier {
  int currentIndex = 0;
  String profileId = "0";
  goHome() {
    currentIndex = 0;
    profileId = "";
    notifyListeners();
  }

  goProfile({id}) {
    currentIndex = 1;
    profileId = id;
    notifyListeners();
  }
}
