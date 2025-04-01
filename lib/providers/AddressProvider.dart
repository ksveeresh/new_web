import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:new_web/model/Address.dart';

class AddressProvider with ChangeNotifier {
  List<Map>? _address;
  String? _selectedId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map>? get address => _address;

  String? get selectedId => _selectedId;

  void setAddress(Map<String, dynamic> data, String id) async {
    _firestore
        .collection("users")
        .doc(id) // User's document
        .collection("Address")
        .doc(data["type"])
        .set(data)
        .then((onValue) {
          loadAddress(id);
        });
    notifyListeners();
  }

  void onAddressSelected(String selectedId) async {
    _selectedId = selectedId;
    notifyListeners();
  }

  Future<void> loadAddress(dynamic id) async {
    // _firestore
    //     .collection("users")
    //     .doc(id) // User's document
    //     .collection("Address")
    //     .get()
    //     .then((onValue) {
    //       _address =
    //           onValue.docs.map((doc) {
    //             return doc.data();
    //           }).toList();
    //       notifyListeners();
    //     });
  }
}
