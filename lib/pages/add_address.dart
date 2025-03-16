import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_web/providers/AddressProvider.dart';
import 'package:new_web/providers/UserDataProvider.dart';
import 'package:provider/provider.dart' show Provider;

class AddAddress extends StatefulWidget {
  Function callBack;

  AddAddress({super.key, required this.callBack});

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();

  final List<String> addressTypes = ["Home", "Work", "Other"];
  final List<String> states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];
  String? selectedAddressType; // Home, Work, Other
  String? selectedState;

  UserDataProvider? sUserData; // Selected state
  AddressProvider? sAddress;

  void _saveAddress(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "name": _nameController.text,
        "type": selectedAddressType,
        "mobile": _mobileController.text,
        "state": selectedState,
        "city": _cityController.text,
        "address": _addressController.text,
        "landmark": _landmarkController.text,
        "pin": _zipController.text,
      };
      sAddress?.setAddress(data, sUserData?.user?["uid"]);
      widget.callBack({});
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Address saved successfully!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    sUserData = Provider.of<UserDataProvider>(context);
    sAddress = Provider.of<AddressProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Address"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.callBack({});
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Address Type",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                value: selectedAddressType,
                items:
                    addressTypes.map((String type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedAddressType = newValue;
                  });
                },
                validator:
                    (value) => value == null ? "Select an address type" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    // Rounded corners
                  ),
                  counterText: "",
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
                validator: (value) {
                  if (value!.isEmpty) return "Enter mobile number";
                  if (value.length != 10)
                    return "Enter a valid 10-digit number";
                  return null;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "State",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                value: selectedState,
                items:
                    states.map((String state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedState = newValue;
                  });
                },
                validator: (value) => value == null ? "Select a state" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: "City",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                validator: (value) => value!.isEmpty ? "Enter city" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: "Address Line 1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                validator: (value) => value!.isEmpty ? "Enter address" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _landmarkController,
                decoration: InputDecoration(
                  labelText: "Landmark (Optional)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _zipController,
                decoration: InputDecoration(
                  labelText: "PinCode",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4), // Rounded corners
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? "Enter PinCode" : null,
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
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
          onPressed: () {
            _saveAddress(context);
          },
          child: Text("Save Address",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}
