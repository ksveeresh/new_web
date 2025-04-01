import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_web/helper/constants.dart';
import 'package:new_web/presenter/p_login.dart';
import 'package:new_web/providers/UserDataProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Function callBack;

  Login({super.key, required this.callBack});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> implements LoginContract {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  UserDataProvider? sUserData;

  @override
  Widget build(BuildContext context) {
    sUserData = Provider.of<UserDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1c5c3c),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              "Login",
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
            child: Text("Don't have an account? Sign up"),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    PLogin(this).login({
      "username": phoneController.text,
      "password": phoneController.text,
    });
  }

  @override
  void hideLoader() {}

  @override
  void onLoginError(data) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data)));
  }

  @override
  void onLoginSuccess(data) {
    if (data is Map) {
      if (data.containsKey("message")) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data["message"])));
        sUserData?.setPage(data["user"] ?? {});
        Navigator.pop(context);
      }
    }
  }

  @override
  void showLoader() {}
}
