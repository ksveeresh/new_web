

import 'package:flutter/material.dart';
import 'package:new_web/pages/about_us.dart';

class PageProvider with ChangeNotifier {
  Widget? _page =AboutUs();
  bool? _showCart;

  Widget? get page => _page;
  bool get showCart => (_showCart??false);

  void setPage(Widget page) async {
    _page = page;
    notifyListeners();
  }
  void setCart(bool showCart) async {
    _showCart = showCart;
    notifyListeners();
  }

}