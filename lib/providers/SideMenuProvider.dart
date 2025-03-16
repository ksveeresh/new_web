import 'package:flutter/material.dart';

class SideMenuProvider with ChangeNotifier {
  Widget? _page;

  Widget? get page => _page;

  void setPage(Widget page) async {
    _page = page;
    notifyListeners();
  }

}