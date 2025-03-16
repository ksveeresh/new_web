import 'package:flutter/material.dart';
import 'package:new_web/pages/login.dart';
import 'package:new_web/pages/sign_up.dart';
import 'package:new_web/providers/UserDataProvider.dart';

class LoginSignupForm extends StatefulWidget {
  const LoginSignupForm({super.key});

  @override
  State<LoginSignupForm> createState() => _LoginSignupFormState();
}

class _LoginSignupFormState extends State<LoginSignupForm> {
  bool isLogin = true;

  UserDataProvider? sUserData; // Toggle between Login & Signup

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var isLargeScreen = width > 800;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Increased for smoother curve
      ),
      child: SizedBox(
        width: !isLargeScreen?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width * 0.3, // 80% of screen width
        height: isLogin?MediaQuery.of(context).size.height * 0.40:MediaQuery.of(context).size.height * 0.60,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(
              40,
            ), // Make sure it's consistent
          ),
          child:
              isLogin
                  ? Login(
                    callBack: () {
                      if (mounted) {
                        setState(() {
                          isLogin = false; // Toggle Login/Signup
                        });
                      }
                    },
                  )
                  : SignUp(
                    callBack: () {
                      if (mounted) {
                        setState(() {
                          isLogin = true; // Toggle Login/Signup
                        });
                      }
                    },
                  ),
        ),
      ),
    );
  }
}
