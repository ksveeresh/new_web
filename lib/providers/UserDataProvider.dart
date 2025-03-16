import 'package:flutter/foundation.dart';

class UserDataProvider with ChangeNotifier {
  Map? _user;

  Map? get user => _user;

  void setPage(Map data) async {
    _user = data;

    notifyListeners();
  }
  void logOut() async {
    _user = null;

    notifyListeners();
  }


}