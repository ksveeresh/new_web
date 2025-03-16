import 'package:flutter/material.dart';
import 'package:new_web/pages/add_address.dart';
import 'package:new_web/pages/cart.dart';
import 'package:new_web/pages/checkout.dart';

class CartCheckout extends StatefulWidget {
  Function callBack;

  CartCheckout({super.key, required this.callBack});

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  int currentPage = 0;

  bool isLargeScreen=false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    isLargeScreen = width > 800;
    return currentPage == 0 ? buildCartPage():currentPage==1? buildCheckoutPage():buildAddAddressPage();
  }

  buildCartPage() {
    return Cart(
      callBack: (s) {
        if (s is Map) {
          if (s.isEmpty) {
            if(isLargeScreen){
              widget.callBack({});
            }else{
              if (mounted) {
                Navigator.of(context).pop();
              }
            }
          }else{
            if(mounted){
              setState(() {
                currentPage =s["page"];
              });
            }

          }
        }

      },
    );
  }

  buildCheckoutPage() {
    return Checkout(
      callBack: (s) {
        if (s is Map) {
          if (s.isEmpty) {
            if (mounted) {
              setState(() {
                currentPage = 0;
              });
            }
          }else{
            if(mounted){
              setState(() {
                currentPage =s["page"];
              });
            }

          }
        }
      },
    );
  }
  buildAddAddressPage() {
    return AddAddress(callBack: (s){
      if (s.isEmpty) {
        if (mounted) {
          setState(() {
            currentPage = 1;
          });
        }
      }
    },);
  }
}
