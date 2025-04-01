import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_web/helper/constants.dart';
import 'package:new_web/pages/login.dart';
import 'package:new_web/presenter/p_register.dart';

class SignUp extends StatefulWidget {
  Function callBack;
  SignUp({super.key, required this.callBack});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> implements RegisterContract {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  Future<void> signup() async {
    try {
      PRegister(this).register({
        "name": nameController.text,
        "phone": phoneController.text,
        "password": phoneController.text,
        "email": emailController.text,
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: Center(child: Image.asset(Asset.string.kLogo)),
            decoration: BoxDecoration(
              color: Color(0xFF1c5c3c),
              borderRadius: BorderRadius.circular(
                20,
              ), // Curved corners with radius 20
            ),
          ),
          SizedBox(height: 50),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 10),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email Id",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: signup,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1c5c3c),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => widget.callBack(),
            child: Text("Already have an account? Login"),
          ),
        ],
      ),
    );
  }

  @override
  void hideLoader() {}

  @override
  void onRegisterError(data) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
  }

  @override
  void onRegisterSuccess(data) {
    if (data is Map) {
      if (data.containsKey("message")) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data["message"])));
        widget.callBack();
      }
    }
  }

  @override
  void showLoader() {}
}
