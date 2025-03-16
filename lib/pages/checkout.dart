import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_web/providers/AddressProvider.dart';
import 'package:new_web/providers/UserDataProvider.dart';
import 'package:provider/provider.dart';


class Checkout extends StatelessWidget {
  Function callBack;

  Checkout({super.key,required this.callBack});

  @override
  Widget build(BuildContext context) {
    var address = Provider.of<AddressProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Checkout"),  leading:IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          callBack({});
        },
      ),actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            callBack({"page":2});
            },
        )
      ],),
      body:  (address.address?.isEmpty??false)
          ? Center(child: Text("No addresses found."))
          : ListView.builder(
        itemCount: (address.address??[]).length,
        itemBuilder: (context, index) {
          // Get the address from the list
          var add = address.address?[index];
          String addressId = add?['type']; // Assuming each address has a unique 'id'

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: RadioListTile<String>(
              title: Text((add?['name'] ?? "No Name")+" (${add?['type'] ?? "No Name"})"),
              subtitle: Text(add?['address'] ?? "No Address"),
              value: addressId,  // Set the value to the address id
              groupValue: address.selectedId,  // Bind the selected address
              onChanged: (String? value) {
                // When the radio button is selected, call this method
                address.onAddressSelected(value!);
              },
              activeColor: Colors.blue,  // Optional: Set the color for the selected radio button
            ),
          );
        },
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
          onPressed:address.selectedId!=null? () {

          }:null,
          child: Text("Place Order",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }


}