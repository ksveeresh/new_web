
import 'package:flutter/foundation.dart';
import 'package:new_web/model/CartItem.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  void addItem(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity++;
    } else {
      _items[productId] = CartItem(id: productId, title: title, price: price);
    }
    notifyListeners();
  }
   hasItem(String productId) {
    if (_items.containsKey(productId)) {
     return true;
    } else {
      return false;

    }
  }
  getItemCount(String productId) {
    if (_items.containsKey(productId)) {
     return _items[productId]?.quantity??0;
    } else {
      return 0;
    }
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
  void removeOneItem(String productId) {
    if (_items.containsKey(productId)) {
      if(_items[productId]!.quantity >1){
        _items[productId]!.quantity--;
        notifyListeners();
      }else{
        _items.remove(productId);
        notifyListeners();
      }
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}