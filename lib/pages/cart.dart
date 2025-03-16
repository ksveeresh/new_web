import 'package:flutter/material.dart';
import 'package:new_web/helper/constants.dart';
import 'package:new_web/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Function callBack;

  Cart({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            callBack({});
          },
        ),
      ),
      body:
          cart.items.isEmpty
              ? Center(child: Text("No items in cart!"))
              : ListView(
                children:
                    cart.items.values.map((item) {
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.all(4),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              child: Image.asset(
                                Asset.string.kProd,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(item.title),
                            subtitle: Text("Price: ${item.price}"),
                            trailing: Container(
                              width: 75,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFF1c5c3c),
                                borderRadius: BorderRadius.circular(8),
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<CartProvider>(
                                        context,
                                        listen: false,
                                      ).removeOneItem(item.id.toString());
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${Provider.of<CartProvider>(context).getItemCount(item.id.toString())}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Provider.of<CartProvider>(
                                        context,
                                        listen: false,
                                      ).addItem(
                                        item.id.toString(),
                                        item.title.toString(),
                                        double.parse((item.price).toString()),
                                      );
                                    },
                                    child: Icon(Icons.add, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
      bottomNavigationBar: Container(
        height: 50,
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1c5c3c),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed:
              cart.items.isEmpty
                  ? null
                  : () {
                    callBack({"page": 1});
                  },
          child: Text("Checkout (\$${cart.totalAmount.toStringAsFixed(2)})",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}
