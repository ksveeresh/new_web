import 'package:flutter/material.dart';
import 'package:new_web/helper/constants.dart';
import 'package:new_web/providers/CartProvider.dart';
import 'package:new_web/providers/UserDataProvider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  Map product;
  Function callback;

  ProductDetails({super.key, required this.product, required this.callback});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Text(
          widget.product["name"].toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.callback({});
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                Asset.string.kProd,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ingredients:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.product["Ingredients"].toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Benefits:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.product["Benefits"].toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "₹${widget.product["price"] ?? ""}/1000gms",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF1c5c3c),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Provider.of<CartProvider>(
                  context,
                ).hasItem(widget.product['id'].toString())
                ? Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF1c5c3c),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(
                            context,
                            listen: false,
                          ).removeOneItem(widget.product['id'].toString());
                        },
                        icon: Icon(Icons.remove, color: Colors.white),
                      ),
                      Text(
                        '${Provider.of<CartProvider>(context).getItemCount(widget.product['id'].toString())}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(
                            context,
                            listen: false,
                          ).addItem(
                            widget.product['id'].toString(),
                            widget.product['name'].toString(),
                            double.parse(
                              (widget.product['price'] ?? "0").toString(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                )
                : Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if ((Provider.of<UserDataProvider>(
                                context,
                                listen: false,
                              ).user ??
                              {})
                          .isNotEmpty) {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addItem(
                          widget.product['id'].toString(),
                          widget.product['name'].toString(),
                          double.parse(
                            (widget.product['price'] ?? "0").toString(),
                          ),
                        );
                      } else {
                        widget.callback({"page": "1"});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1c5c3c),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
